let
    BaseUrl = "https://www.nutritics.com/api/v1.2/LIST/",
    UserID = "181268",
    BatchSize = 100, // API limit per request

    FetchPage = (Offset) =>
        let
            // Static Base URL + Query parameters for cloud refresh compatibility
            Source = Json.Document(Web.Contents(BaseUrl, [
                Query = [
                    user = UserID,
                    food = "", 
                    limit = Text.From(Offset) & "," & Text.From(BatchSize)
                ],
                Timeout = #duration(0, 0, 4, 0) // Max 4-minute Service timeout
            ])),
            DataItems = Record.FieldValues(Source),
            CleanItems = List.Select(DataItems, each Value.Is(_, type record))
        in
            CleanItems,

    // The loop: Starts at 0, adds 100 each time, stops when Records are empty
    AllPages = List.Generate(
        () => [Offset = 0, Records = FetchPage(0)],
        each List.Count([Records]) > 0, 
        each [Offset = [Offset] + BatchSize, Records = FetchPage([Offset] + BatchSize)],
        each [Records]
    ),

    CombinedList = List.Combine(AllPages),
    TableResult = Table.FromList(CombinedList, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
    ColumnNames = Record.FieldNames(TableResult{0}[Column1]),
    FinalTable = Table.ExpandRecordColumn(TableResult, "Column1", ColumnNames)
in
    FinalTable
