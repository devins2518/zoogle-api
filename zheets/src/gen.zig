// Auto-generated file. DO NOT EDIT.

const std = @import("std");
const requestz = @import("requestz");
const oauth2 = requestz.oauth2;
const StringHashMap = std.StringHashMap;
const Allocator = std.mem.Allocator;
const Headers = requestz.Headers;

const log = std.log.scoped(.zoogle_api);

pub const base_url = "https://sheets.googleapis.com/";
pub const root_url = "https://sheets.googleapis.com/";

pub const Scope = enum {
    // See, edit, create, and delete all of your Google Drive files
    drive,
    // See, edit, create, and delete only the specific Google Drive files you use with this app
    driveFile,
    // See and download all your Google Drive files
    driveReadonly,
    // See, edit, create, and delete all your Google Sheets spreadsheets
    spreadsheets,
    // See all your Google Sheets spreadsheets
    spreadsheetsReadonly,

    pub fn toStr(self: @This()) []const u8 {
        return switch (self) {
            .drive => "https://www.googleapis.com/auth/drive",
            .driveFile => "https://www.googleapis.com/auth/drive.file",
            .driveReadonly => "https://www.googleapis.com/auth/drive.readonly",
            .spreadsheets => "https://www.googleapis.com/auth/spreadsheets",
            .spreadsheetsReadonly => "https://www.googleapis.com/auth/spreadsheets.readonly",
        };
    }
};

// Adds a new banded range to the spreadsheet.
pub const AddBandingRequestSchema = struct {
    const Self = @This();
    // The banded range to add. The bandedRangeId field is optional; if one is not set, an id will be randomly generated. (It is an error to specify the ID of a range that already exists.)
    bandedRange: BandedRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The result of adding a banded range.
pub const AddBandingResponseSchema = struct {
    const Self = @This();
    // The banded range that was added.
    bandedRange: BandedRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Adds a chart to a sheet in the spreadsheet.
pub const AddChartRequestSchema = struct {
    const Self = @This();
    // The chart that should be added to the spreadsheet, including the position where it should be placed. The chartId field is optional; if one is not set, an id will be randomly generated. (It is an error to specify the ID of an embedded object that already exists.)
    chart: EmbeddedChartSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The result of adding a chart to a spreadsheet.
pub const AddChartResponseSchema = struct {
    const Self = @This();
    // The newly added chart.
    chart: EmbeddedChartSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Adds a new conditional format rule at the given index. All subsequent rules' indexes are incremented.
pub const AddConditionalFormatRuleRequestSchema = struct {
    const Self = @This();
    // The zero-based index where the rule should be inserted.
    index: i32,
    // The rule to add.
    rule: ConditionalFormatRuleSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Adds a data source. After the data source is added successfully, an associated DATA_SOURCE sheet is created and an execution is triggered to refresh the sheet to read data from the data source. The request requires an additional `bigquery.readonly` OAuth scope.
pub const AddDataSourceRequestSchema = struct {
    const Self = @This();
    // The data source to add.
    dataSource: DataSourceSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The result of adding a data source.
pub const AddDataSourceResponseSchema = struct {
    const Self = @This();
    // The data execution status.
    dataExecutionStatus: DataExecutionStatusSchema,
    // The data source that was created.
    dataSource: DataSourceSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Creates a group over the specified range. If the requested range is a superset of the range of an existing group G, then the depth of G is incremented and this new group G' has the depth of that group. For example, a group [C:D, depth 1] + [B:E] results in groups [B:E, depth 1] and [C:D, depth 2]. If the requested range is a subset of the range of an existing group G, then the depth of the new group G' becomes one greater than the depth of G. For example, a group [B:E, depth 1] + [C:D] results in groups [B:E, depth 1] and [C:D, depth 2]. If the requested range starts before and ends within, or starts within and ends after, the range of an existing group G, then the range of the existing group G becomes the union of the ranges, and the new group G' has depth one greater than the depth of G and range as the intersection of the ranges. For example, a group [B:D, depth 1] + [C:E] results in groups [B:E, depth 1] and [C:D, depth 2].
pub const AddDimensionGroupRequestSchema = struct {
    const Self = @This();
    // The range over which to create a group.
    range: DimensionRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The result of adding a group.
pub const AddDimensionGroupResponseSchema = struct {
    const Self = @This();
    // All groups of a dimension after adding a group to that dimension.
    dimensionGroups: []const DimensionGroupSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Adds a filter view.
pub const AddFilterViewRequestSchema = struct {
    const Self = @This();
    // The filter to add. The filterViewId field is optional; if one is not set, an id will be randomly generated. (It is an error to specify the ID of a filter that already exists.)
    filter: FilterViewSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The result of adding a filter view.
pub const AddFilterViewResponseSchema = struct {
    const Self = @This();
    // The newly added filter view.
    filter: FilterViewSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Adds a named range to the spreadsheet.
pub const AddNamedRangeRequestSchema = struct {
    const Self = @This();
    // The named range to add. The namedRangeId field is optional; if one is not set, an id will be randomly generated. (It is an error to specify the ID of a range that already exists.)
    namedRange: NamedRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The result of adding a named range.
pub const AddNamedRangeResponseSchema = struct {
    const Self = @This();
    // The named range to add.
    namedRange: NamedRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Adds a new protected range.
pub const AddProtectedRangeRequestSchema = struct {
    const Self = @This();
    // The protected range to be added. The protectedRangeId field is optional; if one is not set, an id will be randomly generated. (It is an error to specify the ID of a range that already exists.)
    protectedRange: ProtectedRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The result of adding a new protected range.
pub const AddProtectedRangeResponseSchema = struct {
    const Self = @This();
    // The newly added protected range.
    protectedRange: ProtectedRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Adds a new sheet. When a sheet is added at a given index, all subsequent sheets' indexes are incremented. To add an object sheet, use AddChartRequest instead and specify EmbeddedObjectPosition.sheetId or EmbeddedObjectPosition.newSheet.
pub const AddSheetRequestSchema = struct {
    const Self = @This();
    // The properties the new sheet should have. All properties are optional. The sheetId field is optional; if one is not set, an id will be randomly generated. (It is an error to specify the ID of a sheet that already exists.)
    properties: SheetPropertiesSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The result of adding a sheet.
pub const AddSheetResponseSchema = struct {
    const Self = @This();
    // The properties of the newly added sheet.
    properties: SheetPropertiesSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Adds a slicer to a sheet in the spreadsheet.
pub const AddSlicerRequestSchema = struct {
    const Self = @This();
    // The slicer that should be added to the spreadsheet, including the position where it should be placed. The slicerId field is optional; if one is not set, an id will be randomly generated. (It is an error to specify the ID of a slicer that already exists.)
    slicer: SlicerSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The result of adding a slicer to a spreadsheet.
pub const AddSlicerResponseSchema = struct {
    const Self = @This();
    // The newly added slicer.
    slicer: SlicerSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Adds new cells after the last row with data in a sheet, inserting new rows into the sheet if necessary.
pub const AppendCellsRequestSchema = struct {
    const Self = @This();
    // The fields of CellData that should be updated. At least one field must be specified. The root is the CellData; 'row.values.' should not be specified. A single `"*"` can be used as short-hand for listing every field.
    fields: []const u8,
    // The data to append.
    rows: []const RowDataSchema,
    // The sheet ID to append the data to.
    sheetId: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Appends rows or columns to the end of a sheet.
pub const AppendDimensionRequestSchema = struct {
    const Self = @This();
    // Whether rows or columns should be appended.
    dimension: []const u8,
    // The number of rows or columns to append.
    length: i32,
    // The sheet to append rows or columns to.
    sheetId: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The response when updating a range of values in a spreadsheet.
pub const AppendValuesResponseSchema = struct {
    const Self = @This();
    // The spreadsheet the updates were applied to.
    spreadsheetId: []const u8,
    // The range (in A1 notation) of the table that values are being appended to (before the values were appended). Empty if no table was found.
    tableRange: []const u8,
    // Information about the updates that were applied.
    updates: UpdateValuesResponseSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Fills in more data based on existing data.
pub const AutoFillRequestSchema = struct {
    const Self = @This();
    // The range to autofill. This will examine the range and detect the location that has data and automatically fill that data in to the rest of the range.
    range: GridRangeSchema,
    // The source and destination areas to autofill. This explicitly lists the source of the autofill and where to extend that data.
    sourceAndDestination: SourceAndDestinationSchema,
    // True if we should generate data with the "alternate" series. This differs based on the type and amount of source data.
    useAlternateSeries: bool,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Automatically resizes one or more dimensions based on the contents of the cells in that dimension.
pub const AutoResizeDimensionsRequestSchema = struct {
    const Self = @This();
    // The dimensions on a data source sheet to automatically resize.
    dataSourceSheetDimensions: DataSourceSheetDimensionRangeSchema,
    // The dimensions to automatically resize.
    dimensions: DimensionRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A banded (alternating colors) range in a sheet.
pub const BandedRangeSchema = struct {
    const Self = @This();
    // The id of the banded range.
    bandedRangeId: i32,
    // Properties for column bands. These properties are applied on a column- by-column basis throughout all the columns in the range. At least one of row_properties or column_properties must be specified.
    columnProperties: BandingPropertiesSchema,
    // The range over which these properties are applied.
    range: GridRangeSchema,
    // Properties for row bands. These properties are applied on a row-by-row basis throughout all the rows in the range. At least one of row_properties or column_properties must be specified.
    rowProperties: BandingPropertiesSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Properties referring a single dimension (either row or column). If both BandedRange.row_properties and BandedRange.column_properties are set, the fill colors are applied to cells according to the following rules: * header_color and footer_color take priority over band colors. * first_band_color takes priority over second_band_color. * row_properties takes priority over column_properties. For example, the first row color takes priority over the first column color, but the first column color takes priority over the second row color. Similarly, the row header takes priority over the column header in the top left cell, but the column header takes priority over the first row color if the row header is not set.
pub const BandingPropertiesSchema = struct {
    const Self = @This();
    // The first color that is alternating. (Required) Deprecated: Use first_band_color_style.
    firstBandColor: ColorSchema,
    // The first color that is alternating. (Required) If first_band_color is also set, this field takes precedence.
    firstBandColorStyle: ColorStyleSchema,
    // The color of the last row or column. If this field is not set, the last row or column is filled with either first_band_color or second_band_color, depending on the color of the previous row or column. Deprecated: Use footer_color_style.
    footerColor: ColorSchema,
    // The color of the last row or column. If this field is not set, the last row or column is filled with either first_band_color or second_band_color, depending on the color of the previous row or column. If footer_color is also set, this field takes precedence.
    footerColorStyle: ColorStyleSchema,
    // The color of the first row or column. If this field is set, the first row or column is filled with this color and the colors alternate between first_band_color and second_band_color starting from the second row or column. Otherwise, the first row or column is filled with first_band_color and the colors proceed to alternate as they normally would. Deprecated: Use header_color_style.
    headerColor: ColorSchema,
    // The color of the first row or column. If this field is set, the first row or column is filled with this color and the colors alternate between first_band_color and second_band_color starting from the second row or column. Otherwise, the first row or column is filled with first_band_color and the colors proceed to alternate as they normally would. If header_color is also set, this field takes precedence.
    headerColorStyle: ColorStyleSchema,
    // The second color that is alternating. (Required) Deprecated: Use second_band_color_style.
    secondBandColor: ColorSchema,
    // The second color that is alternating. (Required) If second_band_color is also set, this field takes precedence.
    secondBandColorStyle: ColorStyleSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Formatting options for baseline value.
pub const BaselineValueFormatSchema = struct {
    const Self = @This();
    // The comparison type of key value with baseline value.
    comparisonType: []const u8,
    // Description which is appended after the baseline value. This field is optional.
    description: []const u8,
    // Color to be used, in case baseline value represents a negative change for key value. This field is optional. Deprecated: Use negative_color_style.
    negativeColor: ColorSchema,
    // Color to be used, in case baseline value represents a negative change for key value. This field is optional. If negative_color is also set, this field takes precedence.
    negativeColorStyle: ColorStyleSchema,
    // Specifies the horizontal text positioning of baseline value. This field is optional. If not specified, default positioning is used.
    position: TextPositionSchema,
    // Color to be used, in case baseline value represents a positive change for key value. This field is optional. Deprecated: Use positive_color_style.
    positiveColor: ColorSchema,
    // Color to be used, in case baseline value represents a positive change for key value. This field is optional. If positive_color is also set, this field takes precedence.
    positiveColorStyle: ColorStyleSchema,
    // Text formatting options for baseline value. The link field is not supported.
    textFormat: TextFormatSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// An axis of the chart. A chart may not have more than one axis per axis position.
pub const BasicChartAxisSchema = struct {
    const Self = @This();
    // The format of the title. Only valid if the axis is not associated with the domain. The link field is not supported.
    format: TextFormatSchema,
    // The position of this axis.
    position: []const u8,
    // The title of this axis. If set, this overrides any title inferred from headers of the data.
    title: []const u8,
    // The axis title text position.
    titleTextPosition: TextPositionSchema,
    // The view window options for this axis.
    viewWindowOptions: ChartAxisViewWindowOptionsSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The domain of a chart. For example, if charting stock prices over time, this would be the date.
pub const BasicChartDomainSchema = struct {
    const Self = @This();
    // The data of the domain. For example, if charting stock prices over time, this is the data representing the dates.
    domain: ChartDataSchema,
    // True to reverse the order of the domain values (horizontal axis).
    reversed: bool,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A single series of data in a chart. For example, if charting stock prices over time, multiple series may exist, one for the "Open Price", "High Price", "Low Price" and "Close Price".
pub const BasicChartSeriesSchema = struct {
    const Self = @This();
    // The color for elements (such as bars, lines, and points) associated with this series. If empty, a default color is used. Deprecated: Use color_style.
    color: ColorSchema,
    // The color for elements (such as bars, lines, and points) associated with this series. If empty, a default color is used. If color is also set, this field takes precedence.
    colorStyle: ColorStyleSchema,
    // Information about the data labels for this series.
    dataLabel: DataLabelSchema,
    // The line style of this series. Valid only if the chartType is AREA, LINE, or SCATTER. COMBO charts are also supported if the series chart type is AREA or LINE.
    lineStyle: LineStyleSchema,
    // The style for points associated with this series. Valid only if the chartType is AREA, LINE, or SCATTER. COMBO charts are also supported if the series chart type is AREA, LINE, or SCATTER. If empty, a default point style is used.
    pointStyle: PointStyleSchema,
    // The data being visualized in this chart series.
    series: ChartDataSchema,
    // Style override settings for series data points.
    styleOverrides: []const BasicSeriesDataPointStyleOverrideSchema,
    // The minor axis that will specify the range of values for this series. For example, if charting stocks over time, the "Volume" series may want to be pinned to the right with the prices pinned to the left, because the scale of trading volume is different than the scale of prices. It is an error to specify an axis that isn't a valid minor axis for the chart's type.
    targetAxis: []const u8,
    // The type of this series. Valid only if the chartType is COMBO. Different types will change the way the series is visualized. Only LINE, AREA, and COLUMN are supported.
    type: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The specification for a basic chart. See BasicChartType for the list of charts this supports.
pub const BasicChartSpecSchema = struct {
    const Self = @This();
    // The axis on the chart.
    axis: []const BasicChartAxisSchema,
    // The type of the chart.
    chartType: []const u8,
    // The behavior of tooltips and data highlighting when hovering on data and chart area.
    compareMode: []const u8,
    // The domain of data this is charting. Only a single domain is supported.
    domains: []const BasicChartDomainSchema,
    // The number of rows or columns in the data that are "headers". If not set, Google Sheets will guess how many rows are headers based on the data. (Note that BasicChartAxis.title may override the axis title inferred from the header values.)
    headerCount: i32,
    // If some values in a series are missing, gaps may appear in the chart (e.g, segments of lines in a line chart will be missing). To eliminate these gaps set this to true. Applies to Line, Area, and Combo charts.
    interpolateNulls: bool,
    // The position of the chart legend.
    legendPosition: []const u8,
    // Gets whether all lines should be rendered smooth or straight by default. Applies to Line charts.
    lineSmoothing: bool,
    // The data this chart is visualizing.
    series: []const BasicChartSeriesSchema,
    // The stacked type for charts that support vertical stacking. Applies to Area, Bar, Column, Combo, and Stepped Area charts.
    stackedType: []const u8,
    // True to make the chart 3D. Applies to Bar and Column charts.
    threeDimensional: bool,
    // Controls whether to display additional data labels on stacked charts which sum the total value of all stacked values at each value along the domain axis. These data labels can only be set when chart_type is one of AREA, BAR, COLUMN, COMBO or STEPPED_AREA and stacked_type is either STACKED or PERCENT_STACKED. In addition, for COMBO, this will only be supported if there is only one type of stackable series type or one type has more series than the others and each of the other types have no more than one series. For example, if a chart has two stacked bar series and one area series, the total data labels will be supported. If it has three bar series and two area series, total data labels are not allowed. Neither CUSTOM nor placement can be set on the total_data_label.
    totalDataLabel: DataLabelSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The default filter associated with a sheet.
pub const BasicFilterSchema = struct {
    const Self = @This();
    // The criteria for showing/hiding values per column. The map's key is the column index, and the value is the criteria for that column. This field is deprecated in favor of filter_specs.
    criteria: StringHashMap(FilterCriteriaSchema),
    // The filter criteria per column. Both criteria and filter_specs are populated in responses. If both fields are specified in an update request, this field takes precedence.
    filterSpecs: []const FilterSpecSchema,
    // The range the filter covers.
    range: GridRangeSchema,
    // The sort order per column. Later specifications are used when values are equal in the earlier specifications.
    sortSpecs: []const SortSpecSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Style override settings for a single series data point.
pub const BasicSeriesDataPointStyleOverrideSchema = struct {
    const Self = @This();
    // Color of the series data point. If empty, the series default is used. Deprecated: Use color_style.
    color: ColorSchema,
    // Color of the series data point. If empty, the series default is used. If color is also set, this field takes precedence.
    colorStyle: ColorStyleSchema,
    // Zero based index of the series data point.
    index: i32,
    // Point style of the series data point. Valid only if the chartType is AREA, LINE, or SCATTER. COMBO charts are also supported if the series chart type is AREA, LINE, or SCATTER. If empty, the series default is used.
    pointStyle: PointStyleSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The request for clearing more than one range selected by a DataFilter in a spreadsheet.
pub const BatchClearValuesByDataFilterRequestSchema = struct {
    const Self = @This();
    // The DataFilters used to determine which ranges to clear.
    dataFilters: []const DataFilterSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The response when clearing a range of values selected with DataFilters in a spreadsheet.
pub const BatchClearValuesByDataFilterResponseSchema = struct {
    const Self = @This();
    // The ranges that were cleared, in [A1 notation](/sheets/api/guides/concepts#cell). If the requests are for an unbounded range or a ranger larger than the bounds of the sheet, this is the actual ranges that were cleared, bounded to the sheet's limits.
    clearedRanges: []const []const u8,
    // The spreadsheet the updates were applied to.
    spreadsheetId: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The request for clearing more than one range of values in a spreadsheet.
pub const BatchClearValuesRequestSchema = struct {
    const Self = @This();
    // The ranges to clear, in [A1 notation or R1C1 notation](/sheets/api/guides/concepts#cell).
    ranges: []const []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The response when clearing a range of values in a spreadsheet.
pub const BatchClearValuesResponseSchema = struct {
    const Self = @This();
    // The ranges that were cleared, in A1 notation. If the requests are for an unbounded range or a ranger larger than the bounds of the sheet, this is the actual ranges that were cleared, bounded to the sheet's limits.
    clearedRanges: []const []const u8,
    // The spreadsheet the updates were applied to.
    spreadsheetId: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The request for retrieving a range of values in a spreadsheet selected by a set of DataFilters.
pub const BatchGetValuesByDataFilterRequestSchema = struct {
    const Self = @This();
    // The data filters used to match the ranges of values to retrieve. Ranges that match any of the specified data filters are included in the response.
    dataFilters: []const DataFilterSchema,
    // How dates, times, and durations should be represented in the output. This is ignored if value_render_option is FORMATTED_VALUE. The default dateTime render option is SERIAL_NUMBER.
    dateTimeRenderOption: []const u8,
    // The major dimension that results should use. For example, if the spreadsheet data is: `A1=1,B1=2,A2=3,B2=4`, then a request that selects that range and sets `majorDimension=ROWS` returns `[[1,2],[3,4]]`, whereas a request that sets `majorDimension=COLUMNS` returns `[[1,3],[2,4]]`.
    majorDimension: []const u8,
    // How values should be represented in the output. The default render option is FORMATTED_VALUE.
    valueRenderOption: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The response when retrieving more than one range of values in a spreadsheet selected by DataFilters.
pub const BatchGetValuesByDataFilterResponseSchema = struct {
    const Self = @This();
    // The ID of the spreadsheet the data was retrieved from.
    spreadsheetId: []const u8,
    // The requested values with the list of data filters that matched them.
    valueRanges: []const MatchedValueRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The response when retrieving more than one range of values in a spreadsheet.
pub const BatchGetValuesResponseSchema = struct {
    const Self = @This();
    // The ID of the spreadsheet the data was retrieved from.
    spreadsheetId: []const u8,
    // The requested values. The order of the ValueRanges is the same as the order of the requested ranges.
    valueRanges: []const ValueRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The request for updating any aspect of a spreadsheet.
pub const BatchUpdateSpreadsheetRequestSchema = struct {
    const Self = @This();
    // Determines if the update response should include the spreadsheet resource.
    includeSpreadsheetInResponse: bool,
    // A list of updates to apply to the spreadsheet. Requests will be applied in the order they are specified. If any request is not valid, no requests will be applied.
    requests: []const RequestSchema,
    // True if grid data should be returned. Meaningful only if include_spreadsheet_in_response is 'true'. This parameter is ignored if a field mask was set in the request.
    responseIncludeGridData: bool,
    // Limits the ranges included in the response spreadsheet. Meaningful only if include_spreadsheet_in_response is 'true'.
    responseRanges: []const []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The reply for batch updating a spreadsheet.
pub const BatchUpdateSpreadsheetResponseSchema = struct {
    const Self = @This();
    // The reply of the updates. This maps 1:1 with the updates, although replies to some requests may be empty.
    replies: []const ResponseSchema,
    // The spreadsheet the updates were applied to.
    spreadsheetId: []const u8,
    // The spreadsheet after updates were applied. This is only set if BatchUpdateSpreadsheetRequest.include_spreadsheet_in_response is `true`.
    updatedSpreadsheet: SpreadsheetSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The request for updating more than one range of values in a spreadsheet.
pub const BatchUpdateValuesByDataFilterRequestSchema = struct {
    const Self = @This();
    // The new values to apply to the spreadsheet. If more than one range is matched by the specified DataFilter the specified values are applied to all of those ranges.
    data: []const DataFilterValueRangeSchema,
    // Determines if the update response should include the values of the cells that were updated. By default, responses do not include the updated values. The `updatedData` field within each of the BatchUpdateValuesResponse.responses contains the updated values. If the range to write was larger than the range actually written, the response includes all values in the requested range (excluding trailing empty rows and columns).
    includeValuesInResponse: bool,
    // Determines how dates, times, and durations in the response should be rendered. This is ignored if response_value_render_option is FORMATTED_VALUE. The default dateTime render option is SERIAL_NUMBER.
    responseDateTimeRenderOption: []const u8,
    // Determines how values in the response should be rendered. The default render option is FORMATTED_VALUE.
    responseValueRenderOption: []const u8,
    // How the input data should be interpreted.
    valueInputOption: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The response when updating a range of values in a spreadsheet.
pub const BatchUpdateValuesByDataFilterResponseSchema = struct {
    const Self = @This();
    // The response for each range updated.
    responses: []const UpdateValuesByDataFilterResponseSchema,
    // The spreadsheet the updates were applied to.
    spreadsheetId: []const u8,
    // The total number of cells updated.
    totalUpdatedCells: i32,
    // The total number of columns where at least one cell in the column was updated.
    totalUpdatedColumns: i32,
    // The total number of rows where at least one cell in the row was updated.
    totalUpdatedRows: i32,
    // The total number of sheets where at least one cell in the sheet was updated.
    totalUpdatedSheets: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The request for updating more than one range of values in a spreadsheet.
pub const BatchUpdateValuesRequestSchema = struct {
    const Self = @This();
    // The new values to apply to the spreadsheet.
    data: []const ValueRangeSchema,
    // Determines if the update response should include the values of the cells that were updated. By default, responses do not include the updated values. The `updatedData` field within each of the BatchUpdateValuesResponse.responses contains the updated values. If the range to write was larger than the range actually written, the response includes all values in the requested range (excluding trailing empty rows and columns).
    includeValuesInResponse: bool,
    // Determines how dates, times, and durations in the response should be rendered. This is ignored if response_value_render_option is FORMATTED_VALUE. The default dateTime render option is SERIAL_NUMBER.
    responseDateTimeRenderOption: []const u8,
    // Determines how values in the response should be rendered. The default render option is FORMATTED_VALUE.
    responseValueRenderOption: []const u8,
    // How the input data should be interpreted.
    valueInputOption: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The response when updating a range of values in a spreadsheet.
pub const BatchUpdateValuesResponseSchema = struct {
    const Self = @This();
    // One UpdateValuesResponse per requested range, in the same order as the requests appeared.
    responses: []const UpdateValuesResponseSchema,
    // The spreadsheet the updates were applied to.
    spreadsheetId: []const u8,
    // The total number of cells updated.
    totalUpdatedCells: i32,
    // The total number of columns where at least one cell in the column was updated.
    totalUpdatedColumns: i32,
    // The total number of rows where at least one cell in the row was updated.
    totalUpdatedRows: i32,
    // The total number of sheets where at least one cell in the sheet was updated.
    totalUpdatedSheets: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The specification of a BigQuery data source that's connected to a sheet.
pub const BigQueryDataSourceSpecSchema = struct {
    const Self = @This();
    // The ID of a BigQuery enabled GCP project with a billing account attached. For any queries executed against the data source, the project is charged.
    projectId: []const u8,
    // A BigQueryQuerySpec.
    querySpec: BigQueryQuerySpecSchema,
    // A BigQueryTableSpec.
    tableSpec: BigQueryTableSpecSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Specifies a custom BigQuery query.
pub const BigQueryQuerySpecSchema = struct {
    const Self = @This();
    // The raw query string.
    rawQuery: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Specifies a BigQuery table definition. Only [native tables](https://cloud.google.com/bigquery/docs/tables-intro) is allowed.
pub const BigQueryTableSpecSchema = struct {
    const Self = @This();
    // The BigQuery dataset id.
    datasetId: []const u8,
    // The BigQuery table id.
    tableId: []const u8,
    // The ID of a BigQuery project the table belongs to. If not specified, the project_id is assumed.
    tableProjectId: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A condition that can evaluate to true or false. BooleanConditions are used by conditional formatting, data validation, and the criteria in filters.
pub const BooleanConditionSchema = struct {
    const Self = @This();
    // The type of condition.
    type: []const u8,
    // The values of the condition. The number of supported values depends on the condition type. Some support zero values, others one or two values, and ConditionType.ONE_OF_LIST supports an arbitrary number of values.
    values: []const ConditionValueSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A rule that may or may not match, depending on the condition.
pub const BooleanRuleSchema = struct {
    const Self = @This();
    // The condition of the rule. If the condition evaluates to true, the format is applied.
    condition: BooleanConditionSchema,
    // The format to apply. Conditional formatting can only apply a subset of formatting: bold, italic, strikethrough, foreground color & background color.
    format: CellFormatSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A border along a cell.
pub const BorderSchema = struct {
    const Self = @This();
    // The color of the border. Deprecated: Use color_style.
    color: ColorSchema,
    // The color of the border. If color is also set, this field takes precedence.
    colorStyle: ColorStyleSchema,
    // The style of the border.
    style: []const u8,
    // The width of the border, in pixels. Deprecated; the width is determined by the "style" field.
    width: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The borders of the cell.
pub const BordersSchema = struct {
    const Self = @This();
    // The bottom border of the cell.
    bottom: BorderSchema,
    // The left border of the cell.
    left: BorderSchema,
    // The right border of the cell.
    right: BorderSchema,
    // The top border of the cell.
    top: BorderSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A bubble chart.
pub const BubbleChartSpecSchema = struct {
    const Self = @This();
    // The bubble border color. Deprecated: Use bubble_border_color_style.
    bubbleBorderColor: ColorSchema,
    // The bubble border color. If bubble_border_color is also set, this field takes precedence.
    bubbleBorderColorStyle: ColorStyleSchema,
    // The data containing the bubble labels. These do not need to be unique.
    bubbleLabels: ChartDataSchema,
    // The max radius size of the bubbles, in pixels. If specified, the field must be a positive value.
    bubbleMaxRadiusSize: i32,
    // The minimum radius size of the bubbles, in pixels. If specific, the field must be a positive value.
    bubbleMinRadiusSize: i32,
    // The opacity of the bubbles between 0 and 1.0. 0 is fully transparent and 1 is fully opaque.
    bubbleOpacity: f32,
    // The data containing the bubble sizes. Bubble sizes are used to draw the bubbles at different sizes relative to each other. If specified, group_ids must also be specified. This field is optional.
    bubbleSizes: ChartDataSchema,
    // The format of the text inside the bubbles. Strikethrough, underline, and link are not supported.
    bubbleTextStyle: TextFormatSchema,
    // The data containing the bubble x-values. These values locate the bubbles in the chart horizontally.
    domain: ChartDataSchema,
    // The data containing the bubble group IDs. All bubbles with the same group ID are drawn in the same color. If bubble_sizes is specified then this field must also be specified but may contain blank values. This field is optional.
    groupIds: ChartDataSchema,
    // Where the legend of the chart should be drawn.
    legendPosition: []const u8,
    // The data containing the bubble y-values. These values locate the bubbles in the chart vertically.
    series: ChartDataSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A candlestick chart.
pub const CandlestickChartSpecSchema = struct {
    const Self = @This();
    // The Candlestick chart data. Only one CandlestickData is supported.
    data: []const CandlestickDataSchema,
    // The domain data (horizontal axis) for the candlestick chart. String data will be treated as discrete labels, other data will be treated as continuous values.
    domain: CandlestickDomainSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The Candlestick chart data, each containing the low, open, close, and high values for a series.
pub const CandlestickDataSchema = struct {
    const Self = @This();
    // The range data (vertical axis) for the close/final value for each candle. This is the top of the candle body. If greater than the open value the candle will be filled. Otherwise the candle will be hollow.
    closeSeries: CandlestickSeriesSchema,
    // The range data (vertical axis) for the high/maximum value for each candle. This is the top of the candle's center line.
    highSeries: CandlestickSeriesSchema,
    // The range data (vertical axis) for the low/minimum value for each candle. This is the bottom of the candle's center line.
    lowSeries: CandlestickSeriesSchema,
    // The range data (vertical axis) for the open/initial value for each candle. This is the bottom of the candle body. If less than the close value the candle will be filled. Otherwise the candle will be hollow.
    openSeries: CandlestickSeriesSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The domain of a CandlestickChart.
pub const CandlestickDomainSchema = struct {
    const Self = @This();
    // The data of the CandlestickDomain.
    data: ChartDataSchema,
    // True to reverse the order of the domain values (horizontal axis).
    reversed: bool,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The series of a CandlestickData.
pub const CandlestickSeriesSchema = struct {
    const Self = @This();
    // The data of the CandlestickSeries.
    data: ChartDataSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Data about a specific cell.
pub const CellDataSchema = struct {
    const Self = @This();
    // Output only. Information about a data source formula on the cell. The field is set if user_entered_value is a formula referencing some DATA_SOURCE sheet, e.g. `=SUM(DataSheet!Column)`.
    dataSourceFormula: DataSourceFormulaSchema,
    // A data source table anchored at this cell. The size of data source table itself is computed dynamically based on its configuration. Only the first cell of the data source table contains the data source table definition. The other cells will contain the display values of the data source table result in their effective_value fields.
    dataSourceTable: DataSourceTableSchema,
    // A data validation rule on the cell, if any. When writing, the new data validation rule will overwrite any prior rule.
    dataValidation: DataValidationRuleSchema,
    // The effective format being used by the cell. This includes the results of applying any conditional formatting and, if the cell contains a formula, the computed number format. If the effective format is the default format, effective format will not be written. This field is read-only.
    effectiveFormat: CellFormatSchema,
    // The effective value of the cell. For cells with formulas, this is the calculated value. For cells with literals, this is the same as the user_entered_value. This field is read-only.
    effectiveValue: ExtendedValueSchema,
    // The formatted value of the cell. This is the value as it's shown to the user. This field is read-only.
    formattedValue: []const u8,
    // A hyperlink this cell points to, if any. If the cell contains multiple hyperlinks, this field will be empty. This field is read-only. To set it, use a `=HYPERLINK` formula in the userEnteredValue.formulaValue field. A cell-level link can also be set from the userEnteredFormat.textFormat field. Alternatively, set a hyperlink in the textFormatRun.format.link field that spans the entire cell.
    hyperlink: []const u8,
    // Any note on the cell.
    note: []const u8,
    // A pivot table anchored at this cell. The size of pivot table itself is computed dynamically based on its data, grouping, filters, values, etc. Only the top-left cell of the pivot table contains the pivot table definition. The other cells will contain the calculated values of the results of the pivot in their effective_value fields.
    pivotTable: PivotTableSchema,
    // Runs of rich text applied to subsections of the cell. Runs are only valid on user entered strings, not formulas, bools, or numbers. Properties of a run start at a specific index in the text and continue until the next run. Runs will inherit the properties of the cell unless explicitly changed. When writing, the new runs will overwrite any prior runs. When writing a new user_entered_value, previous runs are erased.
    textFormatRuns: []const TextFormatRunSchema,
    // The format the user entered for the cell. When writing, the new format will be merged with the existing format.
    userEnteredFormat: CellFormatSchema,
    // The value the user entered in the cell. e.g, `1234`, `'Hello'`, or `=NOW()` Note: Dates, Times and DateTimes are represented as doubles in serial number format.
    userEnteredValue: ExtendedValueSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The format of a cell.
pub const CellFormatSchema = struct {
    const Self = @This();
    // The background color of the cell. Deprecated: Use background_color_style.
    backgroundColor: ColorSchema,
    // The background color of the cell. If background_color is also set, this field takes precedence.
    backgroundColorStyle: ColorStyleSchema,
    // The borders of the cell.
    borders: BordersSchema,
    // The horizontal alignment of the value in the cell.
    horizontalAlignment: []const u8,
    // If one exists, how a hyperlink should be displayed in the cell.
    hyperlinkDisplayType: []const u8,
    // A format describing how number values should be represented to the user.
    numberFormat: NumberFormatSchema,
    // The padding of the cell.
    padding: PaddingSchema,
    // The direction of the text in the cell.
    textDirection: []const u8,
    // The format of the text in the cell (unless overridden by a format run). Setting a cell-level link here clears the cell's existing links. Setting the link field in a TextFormatRun takes precedence over the cell-level link.
    textFormat: TextFormatSchema,
    // The rotation applied to text in the cell.
    textRotation: TextRotationSchema,
    // The vertical alignment of the value in the cell.
    verticalAlignment: []const u8,
    // The wrap strategy for the value in the cell.
    wrapStrategy: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The options that define a "view window" for a chart (such as the visible values in an axis).
pub const ChartAxisViewWindowOptionsSchema = struct {
    const Self = @This();
    // The maximum numeric value to be shown in this view window. If unset, will automatically determine a maximum value that looks good for the data.
    viewWindowMax: f64,
    // The minimum numeric value to be shown in this view window. If unset, will automatically determine a minimum value that looks good for the data.
    viewWindowMin: f64,
    // The view window's mode.
    viewWindowMode: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Custom number formatting options for chart attributes.
pub const ChartCustomNumberFormatOptionsSchema = struct {
    const Self = @This();
    // Custom prefix to be prepended to the chart attribute. This field is optional.
    prefix: []const u8,
    // Custom suffix to be appended to the chart attribute. This field is optional.
    suffix: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The data included in a domain or series.
pub const ChartDataSchema = struct {
    const Self = @This();
    // The aggregation type for the series of a data source chart. Only supported for data source charts.
    aggregateType: []const u8,
    // The reference to the data source column that the data reads from.
    columnReference: DataSourceColumnReferenceSchema,
    // The rule to group the data by if the ChartData backs the domain of a data source chart. Only supported for data source charts.
    groupRule: ChartGroupRuleSchema,
    // The source ranges of the data.
    sourceRange: ChartSourceRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Allows you to organize the date-time values in a source data column into buckets based on selected parts of their date or time values.
pub const ChartDateTimeRuleSchema = struct {
    const Self = @This();
    // The type of date-time grouping to apply.
    type: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// An optional setting on the ChartData of the domain of a data source chart that defines buckets for the values in the domain rather than breaking out each individual value. For example, when plotting a data source chart, you can specify a histogram rule on the domain (it should only contain numeric values), grouping its values into buckets. Any values of a chart series that fall into the same bucket are aggregated based on the aggregate_type.
pub const ChartGroupRuleSchema = struct {
    const Self = @This();
    // A ChartDateTimeRule.
    dateTimeRule: ChartDateTimeRuleSchema,
    // A ChartHistogramRule
    histogramRule: ChartHistogramRuleSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Allows you to organize numeric values in a source data column into buckets of constant size.
pub const ChartHistogramRuleSchema = struct {
    const Self = @This();
    // The size of the buckets that are created. Must be positive.
    intervalSize: f64,
    // The maximum value at which items are placed into buckets. Values greater than the maximum are grouped into a single bucket. If omitted, it is determined by the maximum item value.
    maxValue: f64,
    // The minimum value at which items are placed into buckets. Values that are less than the minimum are grouped into a single bucket. If omitted, it is determined by the minimum item value.
    minValue: f64,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Source ranges for a chart.
pub const ChartSourceRangeSchema = struct {
    const Self = @This();
    // The ranges of data for a series or domain. Exactly one dimension must have a length of 1, and all sources in the list must have the same dimension with length 1. The domain (if it exists) & all series must have the same number of source ranges. If using more than one source range, then the source range at a given offset must be in order and contiguous across the domain and series. For example, these are valid configurations: domain sources: A1:A5 series1 sources: B1:B5 series2 sources: D6:D10 domain sources: A1:A5, C10:C12 series1 sources: B1:B5, D10:D12 series2 sources: C1:C5, E10:E12
    sources: []const GridRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The specifications of a chart.
pub const ChartSpecSchema = struct {
    const Self = @This();
    // The alternative text that describes the chart. This is often used for accessibility.
    altText: []const u8,
    // The background color of the entire chart. Not applicable to Org charts. Deprecated: Use background_color_style.
    backgroundColor: ColorSchema,
    // The background color of the entire chart. Not applicable to Org charts. If background_color is also set, this field takes precedence.
    backgroundColorStyle: ColorStyleSchema,
    // A basic chart specification, can be one of many kinds of charts. See BasicChartType for the list of all charts this supports.
    basicChart: BasicChartSpecSchema,
    // A bubble chart specification.
    bubbleChart: BubbleChartSpecSchema,
    // A candlestick chart specification.
    candlestickChart: CandlestickChartSpecSchema,
    // If present, the field contains data source chart specific properties.
    dataSourceChartProperties: DataSourceChartPropertiesSchema,
    // The filters applied to the source data of the chart. Only supported for data source charts.
    filterSpecs: []const FilterSpecSchema,
    // The name of the font to use by default for all chart text (e.g. title, axis labels, legend). If a font is specified for a specific part of the chart it will override this font name.
    fontName: []const u8,
    // Determines how the charts will use hidden rows or columns.
    hiddenDimensionStrategy: []const u8,
    // A histogram chart specification.
    histogramChart: HistogramChartSpecSchema,
    // True to make a chart fill the entire space in which it's rendered with minimum padding. False to use the default padding. (Not applicable to Geo and Org charts.)
    maximized: bool,
    // An org chart specification.
    orgChart: OrgChartSpecSchema,
    // A pie chart specification.
    pieChart: PieChartSpecSchema,
    // A scorecard chart specification.
    scorecardChart: ScorecardChartSpecSchema,
    // The order to sort the chart data by. Only a single sort spec is supported. Only supported for data source charts.
    sortSpecs: []const SortSpecSchema,
    // The subtitle of the chart.
    subtitle: []const u8,
    // The subtitle text format. Strikethrough, underline, and link are not supported.
    subtitleTextFormat: TextFormatSchema,
    // The subtitle text position. This field is optional.
    subtitleTextPosition: TextPositionSchema,
    // The title of the chart.
    title: []const u8,
    // The title text format. Strikethrough, underline, and link are not supported.
    titleTextFormat: TextFormatSchema,
    // The title text position. This field is optional.
    titleTextPosition: TextPositionSchema,
    // A treemap chart specification.
    treemapChart: TreemapChartSpecSchema,
    // A waterfall chart specification.
    waterfallChart: WaterfallChartSpecSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Clears the basic filter, if any exists on the sheet.
pub const ClearBasicFilterRequestSchema = struct {
    const Self = @This();
    // The sheet ID on which the basic filter should be cleared.
    sheetId: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The request for clearing a range of values in a spreadsheet.
pub const ClearValuesRequestSchema = struct {
    const Self = @This();
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The response when clearing a range of values in a spreadsheet.
pub const ClearValuesResponseSchema = struct {
    const Self = @This();
    // The range (in A1 notation) that was cleared. (If the request was for an unbounded range or a ranger larger than the bounds of the sheet, this will be the actual range that was cleared, bounded to the sheet's limits.)
    clearedRange: []const u8,
    // The spreadsheet the updates were applied to.
    spreadsheetId: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Represents a color in the RGBA color space. This representation is designed for simplicity of conversion to/from color representations in various languages over compactness. For example, the fields of this representation can be trivially provided to the constructor of `java.awt.Color` in Java; it can also be trivially provided to UIColor's `+colorWithRed:green:blue:alpha` method in iOS; and, with just a little work, it can be easily formatted into a CSS `rgba()` string in JavaScript. This reference page doesn't carry information about the absolute color space that should be used to interpret the RGB value (e.g. sRGB, Adobe RGB, DCI-P3, BT.2020, etc.). By default, applications should assume the sRGB color space. When color equality needs to be decided, implementations, unless documented otherwise, treat two colors as equal if all their red, green, blue, and alpha values each differ by at most 1e-5. Example (Java): import com.google.type.Color; // ... public static java.awt.Color fromProto(Color protocolor) { float alpha = protocolor.hasAlpha() ? protocolor.getAlpha().getValue() : 1.0; return new java.awt.Color( protocolor.getRed(), protocolor.getGreen(), protocolor.getBlue(), alpha); } public static Color toProto(java.awt.Color color) { float red = (float) color.getRed(); float green = (float) color.getGreen(); float blue = (float) color.getBlue(); float denominator = 255.0; Color.Builder resultBuilder = Color .newBuilder() .setRed(red / denominator) .setGreen(green / denominator) .setBlue(blue / denominator); int alpha = color.getAlpha(); if (alpha != 255) { result.setAlpha( FloatValue .newBuilder() .setValue(((float) alpha) / denominator) .build()); } return resultBuilder.build(); } // ... Example (iOS / Obj-C): // ... static UIColor* fromProto(Color* protocolor) { float red = [protocolor red]; float green = [protocolor green]; float blue = [protocolor blue]; FloatValue* alpha_wrapper = [protocolor alpha]; float alpha = 1.0; if (alpha_wrapper != nil) { alpha = [alpha_wrapper value]; } return [UIColor colorWithRed:red green:green blue:blue alpha:alpha]; } static Color* toProto(UIColor* color) { CGFloat red, green, blue, alpha; if (![color getRed:&red green:&green blue:&blue alpha:&alpha]) { return nil; } Color* result = [[Color alloc] init]; [result setRed:red]; [result setGreen:green]; [result setBlue:blue]; if (alpha <= 0.9999) { [result setAlpha:floatWrapperWithValue(alpha)]; } [result autorelease]; return result; } // ... Example (JavaScript): // ... var protoToCssColor = function(rgb_color) { var redFrac = rgb_color.red || 0.0; var greenFrac = rgb_color.green || 0.0; var blueFrac = rgb_color.blue || 0.0; var red = Math.floor(redFrac * 255); var green = Math.floor(greenFrac * 255); var blue = Math.floor(blueFrac * 255); if (!('alpha' in rgb_color)) { return rgbToCssColor(red, green, blue); } var alphaFrac = rgb_color.alpha.value || 0.0; var rgbParams = [red, green, blue].join(','); return ['rgba(', rgbParams, ',', alphaFrac, ')'].join(''); }; var rgbToCssColor = function(red, green, blue) { var rgbNumber = new Number((red << 16) | (green << 8) | blue); var hexString = rgbNumber.toString(16); var missingZeros = 6 - hexString.length; var resultBuilder = ['#']; for (var i = 0; i < missingZeros; i++) { resultBuilder.push('0'); } resultBuilder.push(hexString); return resultBuilder.join(''); }; // ...
pub const ColorSchema = struct {
    const Self = @This();
    // The fraction of this color that should be applied to the pixel. That is, the final pixel color is defined by the equation: `pixel color = alpha * (this color) + (1.0 - alpha) * (background color)` This means that a value of 1.0 corresponds to a solid color, whereas a value of 0.0 corresponds to a completely transparent color. This uses a wrapper message rather than a simple float scalar so that it is possible to distinguish between a default value and the value being unset. If omitted, this color object is rendered as a solid color (as if the alpha value had been explicitly given a value of 1.0).
    alpha: f32,
    // The amount of blue in the color as a value in the interval [0, 1].
    blue: f32,
    // The amount of green in the color as a value in the interval [0, 1].
    green: f32,
    // The amount of red in the color as a value in the interval [0, 1].
    red: f32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A color value.
pub const ColorStyleSchema = struct {
    const Self = @This();
    // RGB color. The [`alpha`](/sheets/api/reference/rest/v4/spreadsheets/other#Color.FIELDS.alpha) value in the [`Color`](/sheets/api/reference/rest/v4/spreadsheets/other#color) object isn't generally supported.
    rgbColor: ColorSchema,
    // Theme color.
    themeColor: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The value of the condition.
pub const ConditionValueSchema = struct {
    const Self = @This();
    // A relative date (based on the current date). Valid only if the type is DATE_BEFORE, DATE_AFTER, DATE_ON_OR_BEFORE or DATE_ON_OR_AFTER. Relative dates are not supported in data validation. They are supported only in conditional formatting and conditional filters.
    relativeDate: []const u8,
    // A value the condition is based on. The value is parsed as if the user typed into a cell. Formulas are supported (and must begin with an `=` or a '+').
    userEnteredValue: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A rule describing a conditional format.
pub const ConditionalFormatRuleSchema = struct {
    const Self = @This();
    // The formatting is either "on" or "off" according to the rule.
    booleanRule: BooleanRuleSchema,
    // The formatting will vary based on the gradients in the rule.
    gradientRule: GradientRuleSchema,
    // The ranges that are formatted if the condition is true. All the ranges must be on the same grid.
    ranges: []const GridRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Copies data from the source to the destination.
pub const CopyPasteRequestSchema = struct {
    const Self = @This();
    // The location to paste to. If the range covers a span that's a multiple of the source's height or width, then the data will be repeated to fill in the destination range. If the range is smaller than the source range, the entire source data will still be copied (beyond the end of the destination range).
    destination: GridRangeSchema,
    // How that data should be oriented when pasting.
    pasteOrientation: []const u8,
    // What kind of data to paste.
    pasteType: []const u8,
    // The source range to copy.
    source: GridRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The request to copy a sheet across spreadsheets.
pub const CopySheetToAnotherSpreadsheetRequestSchema = struct {
    const Self = @This();
    // The ID of the spreadsheet to copy the sheet to.
    destinationSpreadsheetId: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A request to create developer metadata.
pub const CreateDeveloperMetadataRequestSchema = struct {
    const Self = @This();
    // The developer metadata to create.
    developerMetadata: DeveloperMetadataSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The response from creating developer metadata.
pub const CreateDeveloperMetadataResponseSchema = struct {
    const Self = @This();
    // The developer metadata that was created.
    developerMetadata: DeveloperMetadataSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Moves data from the source to the destination.
pub const CutPasteRequestSchema = struct {
    const Self = @This();
    // The top-left coordinate where the data should be pasted.
    destination: GridCoordinateSchema,
    // What kind of data to paste. All the source data will be cut, regardless of what is pasted.
    pasteType: []const u8,
    // The source data to cut.
    source: GridRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The data execution status. A data execution is created to sync a data source object with the latest data from a DataSource. It is usually scheduled to run at background, you can check its state to tell if an execution completes There are several scenarios where a data execution is triggered to run: * Adding a data source creates an associated data source sheet as well as a data execution to sync the data from the data source to the sheet. * Updating a data source creates a data execution to refresh the associated data source sheet similarly. * You can send refresh request to explicitly refresh one or multiple data source objects.
pub const DataExecutionStatusSchema = struct {
    const Self = @This();
    // The error code.
    errorCode: []const u8,
    // The error message, which may be empty.
    errorMessage: []const u8,
    // Gets the time the data last successfully refreshed.
    lastRefreshTime: []const u8,
    // The state of the data execution.
    state: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Filter that describes what data should be selected or returned from a request.
pub const DataFilterSchema = struct {
    const Self = @This();
    // Selects data that matches the specified A1 range.
    a1Range: []const u8,
    // Selects data associated with the developer metadata matching the criteria described by this DeveloperMetadataLookup.
    developerMetadataLookup: DeveloperMetadataLookupSchema,
    // Selects data that matches the range described by the GridRange.
    gridRange: GridRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A range of values whose location is specified by a DataFilter.
pub const DataFilterValueRangeSchema = struct {
    const Self = @This();
    // The data filter describing the location of the values in the spreadsheet.
    dataFilter: DataFilterSchema,
    // The major dimension of the values.
    majorDimension: []const u8,
    // The data to be written. If the provided values exceed any of the ranges matched by the data filter then the request fails. If the provided values are less than the matched ranges only the specified values are written, existing values in the matched ranges remain unaffected.
    values: []const []const []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Settings for one set of data labels. Data labels are annotations that appear next to a set of data, such as the points on a line chart, and provide additional information about what the data represents, such as a text representation of the value behind that point on the graph.
pub const DataLabelSchema = struct {
    const Self = @This();
    // Data to use for custom labels. Only used if type is set to CUSTOM. This data must be the same length as the series or other element this data label is applied to. In addition, if the series is split into multiple source ranges, this source data must come from the next column in the source data. For example, if the series is B2:B4,E6:E8 then this data must come from C2:C4,F6:F8.
    customLabelData: ChartDataSchema,
    // The placement of the data label relative to the labeled data.
    placement: []const u8,
    // The text format used for the data label. The link field is not supported.
    textFormat: TextFormatSchema,
    // The type of the data label.
    type: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Information about an external data source in the spreadsheet.
pub const DataSourceSchema = struct {
    const Self = @This();
    // All calculated columns in the data source.
    calculatedColumns: []const DataSourceColumnSchema,
    // The spreadsheet-scoped unique ID that identifies the data source. Example: 1080547365.
    dataSourceId: []const u8,
    // The ID of the Sheet connected with the data source. The field cannot be changed once set. When creating a data source, an associated DATA_SOURCE sheet is also created, if the field is not specified, the ID of the created sheet will be randomly generated.
    sheetId: i32,
    // The DataSourceSpec for the data source connected with this spreadsheet.
    spec: DataSourceSpecSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Properties of a data source chart.
pub const DataSourceChartPropertiesSchema = struct {
    const Self = @This();
    // Output only. The data execution status.
    dataExecutionStatus: DataExecutionStatusSchema,
    // ID of the data source that the chart is associated with.
    dataSourceId: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A column in a data source.
pub const DataSourceColumnSchema = struct {
    const Self = @This();
    // The formula of the calculated column.
    formula: []const u8,
    // The column reference.
    reference: DataSourceColumnReferenceSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// An unique identifier that references a data source column.
pub const DataSourceColumnReferenceSchema = struct {
    const Self = @This();
    // The display name of the column. It should be unique within a data source.
    name: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A data source formula.
pub const DataSourceFormulaSchema = struct {
    const Self = @This();
    // Output only. The data execution status.
    dataExecutionStatus: DataExecutionStatusSchema,
    // The ID of the data source the formula is associated with.
    dataSourceId: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Reference to a data source object.
pub const DataSourceObjectReferenceSchema = struct {
    const Self = @This();
    // References to a data source chart.
    chartId: i32,
    // References to a cell containing DataSourceFormula.
    dataSourceFormulaCell: GridCoordinateSchema,
    // References to a data source PivotTable anchored at the cell.
    dataSourcePivotTableAnchorCell: GridCoordinateSchema,
    // References to a DataSourceTable anchored at the cell.
    dataSourceTableAnchorCell: GridCoordinateSchema,
    // References to a DATA_SOURCE sheet.
    sheetId: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A list of references to data source objects.
pub const DataSourceObjectReferencesSchema = struct {
    const Self = @This();
    // The references.
    references: []const DataSourceObjectReferenceSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A parameter in a data source's query. The parameter allows the user to pass in values from the spreadsheet into a query.
pub const DataSourceParameterSchema = struct {
    const Self = @This();
    // Named parameter. Must be a legitimate identifier for the DataSource that supports it. For example, [BigQuery identifier](https://cloud.google.com/bigquery/docs/reference/standard-sql/lexical#identifiers).
    name: []const u8,
    // ID of a NamedRange. Its size must be 1x1.
    namedRangeId: []const u8,
    // A range that contains the value of the parameter. Its size must be 1x1.
    range: GridRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A schedule for data to refresh every day in a given time interval.
pub const DataSourceRefreshDailyScheduleSchema = struct {
    const Self = @This();
    // The start time of a time interval in which a data source refresh is scheduled. Only `hours` part is used. The time interval size defaults to that in the Sheets editor.
    startTime: TimeOfDaySchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A monthly schedule for data to refresh on specific days in the month in a given time interval.
pub const DataSourceRefreshMonthlyScheduleSchema = struct {
    const Self = @This();
    // Days of the month to refresh. Only 1-28 are supported, mapping to the 1st to the 28th day. At lesat one day must be specified.
    daysOfMonth: []const i32,
    // The start time of a time interval in which a data source refresh is scheduled. Only `hours` part is used. The time interval size defaults to that in the Sheets editor.
    startTime: TimeOfDaySchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Schedule for refreshing the data source. Data sources in the spreadsheet are refreshed within a time interval. You can specify the start time by clicking the Scheduled Refresh button in the Sheets editor, but the interval is fixed at 4 hours. For example, if you specify a start time of 8am , the refresh will take place between 8am and 12pm every day.
pub const DataSourceRefreshScheduleSchema = struct {
    const Self = @This();
    // Daily refresh schedule.
    dailySchedule: DataSourceRefreshDailyScheduleSchema,
    // True if the refresh schedule is enabled, or false otherwise.
    enabled: bool,
    // Monthly refresh schedule.
    monthlySchedule: DataSourceRefreshMonthlyScheduleSchema,
    // Output only. The time interval of the next run.
    nextRun: IntervalSchema,
    // The scope of the refresh. Must be ALL_DATA_SOURCES.
    refreshScope: []const u8,
    // Weekly refresh schedule.
    weeklySchedule: DataSourceRefreshWeeklyScheduleSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A weekly schedule for data to refresh on specific days in a given time interval.
pub const DataSourceRefreshWeeklyScheduleSchema = struct {
    const Self = @This();
    // Days of the week to refresh. At least one day must be specified.
    daysOfWeek: []const []const u8,
    // The start time of a time interval in which a data source refresh is scheduled. Only `hours` part is used. The time interval size defaults to that in the Sheets editor.
    startTime: TimeOfDaySchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A range along a single dimension on a DATA_SOURCE sheet.
pub const DataSourceSheetDimensionRangeSchema = struct {
    const Self = @This();
    // The columns on the data source sheet.
    columnReferences: []const DataSourceColumnReferenceSchema,
    // The ID of the data source sheet the range is on.
    sheetId: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Additional properties of a DATA_SOURCE sheet.
pub const DataSourceSheetPropertiesSchema = struct {
    const Self = @This();
    // The columns displayed on the sheet, corresponding to the values in RowData.
    columns: []const DataSourceColumnSchema,
    // The data execution status.
    dataExecutionStatus: DataExecutionStatusSchema,
    // ID of the DataSource the sheet is connected to.
    dataSourceId: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// This specifies the details of the data source. For example, for BigQuery, this specifies information about the BigQuery source.
pub const DataSourceSpecSchema = struct {
    const Self = @This();
    // A BigQueryDataSourceSpec.
    bigQuery: BigQueryDataSourceSpecSchema,
    // The parameters of the data source, used when querying the data source.
    parameters: []const DataSourceParameterSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A data source table, which allows the user to import a static table of data from the DataSource into Sheets. This is also known as "Extract" in the Sheets editor.
pub const DataSourceTableSchema = struct {
    const Self = @This();
    // The type to select columns for the data source table. Defaults to SELECTED.
    columnSelectionType: []const u8,
    // Columns selected for the data source table. The column_selection_type must be SELECTED.
    columns: []const DataSourceColumnReferenceSchema,
    // Output only. The data execution status.
    dataExecutionStatus: DataExecutionStatusSchema,
    // The ID of the data source the data source table is associated with.
    dataSourceId: []const u8,
    // Filter specifications in the data source table.
    filterSpecs: []const FilterSpecSchema,
    // The limit of rows to return. If not set, a default limit is applied. Please refer to the Sheets editor for the default and max limit.
    rowLimit: i32,
    // Sort specifications in the data source table. The result of the data source table is sorted based on the sort specifications in order.
    sortSpecs: []const SortSpecSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A data validation rule.
pub const DataValidationRuleSchema = struct {
    const Self = @This();
    // The condition that data in the cell must match.
    condition: BooleanConditionSchema,
    // A message to show the user when adding data to the cell.
    inputMessage: []const u8,
    // True if the UI should be customized based on the kind of condition. If true, "List" conditions will show a dropdown.
    showCustomUi: bool,
    // True if invalid data should be rejected.
    strict: bool,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Allows you to organize the date-time values in a source data column into buckets based on selected parts of their date or time values. For example, consider a pivot table showing sales transactions by date: +----------+--------------+ | Date | SUM of Sales | +----------+--------------+ | 1/1/2017 | $621.14 | | 2/3/2017 | $708.84 | | 5/8/2017 | $326.84 | ... +----------+--------------+ Applying a date-time group rule with a DateTimeRuleType of YEAR_MONTH results in the following pivot table. +--------------+--------------+ | Grouped Date | SUM of Sales | +--------------+--------------+ | 2017-Jan | $53,731.78 | | 2017-Feb | $83,475.32 | | 2017-Mar | $94,385.05 | ... +--------------+--------------+
pub const DateTimeRuleSchema = struct {
    const Self = @This();
    // The type of date-time grouping to apply.
    type: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Removes the banded range with the given ID from the spreadsheet.
pub const DeleteBandingRequestSchema = struct {
    const Self = @This();
    // The ID of the banded range to delete.
    bandedRangeId: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Deletes a conditional format rule at the given index. All subsequent rules' indexes are decremented.
pub const DeleteConditionalFormatRuleRequestSchema = struct {
    const Self = @This();
    // The zero-based index of the rule to be deleted.
    index: i32,
    // The sheet the rule is being deleted from.
    sheetId: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The result of deleting a conditional format rule.
pub const DeleteConditionalFormatRuleResponseSchema = struct {
    const Self = @This();
    // The rule that was deleted.
    rule: ConditionalFormatRuleSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Deletes a data source. The request also deletes the associated data source sheet, and unlinks all associated data source objects.
pub const DeleteDataSourceRequestSchema = struct {
    const Self = @This();
    // The ID of the data source to delete.
    dataSourceId: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A request to delete developer metadata.
pub const DeleteDeveloperMetadataRequestSchema = struct {
    const Self = @This();
    // The data filter describing the criteria used to select which developer metadata entry to delete.
    dataFilter: DataFilterSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The response from deleting developer metadata.
pub const DeleteDeveloperMetadataResponseSchema = struct {
    const Self = @This();
    // The metadata that was deleted.
    deletedDeveloperMetadata: []const DeveloperMetadataSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Deletes a group over the specified range by decrementing the depth of the dimensions in the range. For example, assume the sheet has a depth-1 group over B:E and a depth-2 group over C:D. Deleting a group over D:E leaves the sheet with a depth-1 group over B:D and a depth-2 group over C:C.
pub const DeleteDimensionGroupRequestSchema = struct {
    const Self = @This();
    // The range of the group to be deleted.
    range: DimensionRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The result of deleting a group.
pub const DeleteDimensionGroupResponseSchema = struct {
    const Self = @This();
    // All groups of a dimension after deleting a group from that dimension.
    dimensionGroups: []const DimensionGroupSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Deletes the dimensions from the sheet.
pub const DeleteDimensionRequestSchema = struct {
    const Self = @This();
    // The dimensions to delete from the sheet.
    range: DimensionRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Removes rows within this range that contain values in the specified columns that are duplicates of values in any previous row. Rows with identical values but different letter cases, formatting, or formulas are considered to be duplicates. This request also removes duplicate rows hidden from view (for example, due to a filter). When removing duplicates, the first instance of each duplicate row scanning from the top downwards is kept in the resulting range. Content outside of the specified range isn't removed, and rows considered duplicates do not have to be adjacent to each other in the range.
pub const DeleteDuplicatesRequestSchema = struct {
    const Self = @This();
    // The columns in the range to analyze for duplicate values. If no columns are selected then all columns are analyzed for duplicates.
    comparisonColumns: []const DimensionRangeSchema,
    // The range to remove duplicates rows from.
    range: GridRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The result of removing duplicates in a range.
pub const DeleteDuplicatesResponseSchema = struct {
    const Self = @This();
    // The number of duplicate rows removed.
    duplicatesRemovedCount: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Deletes the embedded object with the given ID.
pub const DeleteEmbeddedObjectRequestSchema = struct {
    const Self = @This();
    // The ID of the embedded object to delete.
    objectId: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Deletes a particular filter view.
pub const DeleteFilterViewRequestSchema = struct {
    const Self = @This();
    // The ID of the filter to delete.
    filterId: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Removes the named range with the given ID from the spreadsheet.
pub const DeleteNamedRangeRequestSchema = struct {
    const Self = @This();
    // The ID of the named range to delete.
    namedRangeId: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Deletes the protected range with the given ID.
pub const DeleteProtectedRangeRequestSchema = struct {
    const Self = @This();
    // The ID of the protected range to delete.
    protectedRangeId: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Deletes a range of cells, shifting other cells into the deleted area.
pub const DeleteRangeRequestSchema = struct {
    const Self = @This();
    // The range of cells to delete.
    range: GridRangeSchema,
    // The dimension from which deleted cells will be replaced with. If ROWS, existing cells will be shifted upward to replace the deleted cells. If COLUMNS, existing cells will be shifted left to replace the deleted cells.
    shiftDimension: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Deletes the requested sheet.
pub const DeleteSheetRequestSchema = struct {
    const Self = @This();
    // The ID of the sheet to delete. If the sheet is of DATA_SOURCE type, the associated DataSource is also deleted.
    sheetId: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Developer metadata associated with a location or object in a spreadsheet. Developer metadata may be used to associate arbitrary data with various parts of a spreadsheet and will remain associated at those locations as they move around and the spreadsheet is edited. For example, if developer metadata is associated with row 5 and another row is then subsequently inserted above row 5, that original metadata will still be associated with the row it was first associated with (what is now row 6). If the associated object is deleted its metadata is deleted too.
pub const DeveloperMetadataSchema = struct {
    const Self = @This();
    // The location where the metadata is associated.
    location: DeveloperMetadataLocationSchema,
    // The spreadsheet-scoped unique ID that identifies the metadata. IDs may be specified when metadata is created, otherwise one will be randomly generated and assigned. Must be positive.
    metadataId: i32,
    // The metadata key. There may be multiple metadata in a spreadsheet with the same key. Developer metadata must always have a key specified.
    metadataKey: []const u8,
    // Data associated with the metadata's key.
    metadataValue: []const u8,
    // The metadata visibility. Developer metadata must always have a visibility specified.
    visibility: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A location where metadata may be associated in a spreadsheet.
pub const DeveloperMetadataLocationSchema = struct {
    const Self = @This();
    // Represents the row or column when metadata is associated with a dimension. The specified DimensionRange must represent a single row or column; it cannot be unbounded or span multiple rows or columns.
    dimensionRange: DimensionRangeSchema,
    // The type of location this object represents. This field is read-only.
    locationType: []const u8,
    // The ID of the sheet when metadata is associated with an entire sheet.
    sheetId: i32,
    // True when metadata is associated with an entire spreadsheet.
    spreadsheet: bool,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Selects DeveloperMetadata that matches all of the specified fields. For example, if only a metadata ID is specified this considers the DeveloperMetadata with that particular unique ID. If a metadata key is specified, this considers all developer metadata with that key. If a key, visibility, and location type are all specified, this considers all developer metadata with that key and visibility that are associated with a location of that type. In general, this selects all DeveloperMetadata that matches the intersection of all the specified fields; any field or combination of fields may be specified.
pub const DeveloperMetadataLookupSchema = struct {
    const Self = @This();
    // Determines how this lookup matches the location. If this field is specified as EXACT, only developer metadata associated on the exact location specified is matched. If this field is specified to INTERSECTING, developer metadata associated on intersecting locations is also matched. If left unspecified, this field assumes a default value of INTERSECTING. If this field is specified, a metadataLocation must also be specified.
    locationMatchingStrategy: []const u8,
    // Limits the selected developer metadata to those entries which are associated with locations of the specified type. For example, when this field is specified as ROW this lookup only considers developer metadata associated on rows. If the field is left unspecified, all location types are considered. This field cannot be specified as SPREADSHEET when the locationMatchingStrategy is specified as INTERSECTING or when the metadataLocation is specified as a non-spreadsheet location: spreadsheet metadata cannot intersect any other developer metadata location. This field also must be left unspecified when the locationMatchingStrategy is specified as EXACT.
    locationType: []const u8,
    // Limits the selected developer metadata to that which has a matching DeveloperMetadata.metadata_id.
    metadataId: i32,
    // Limits the selected developer metadata to that which has a matching DeveloperMetadata.metadata_key.
    metadataKey: []const u8,
    // Limits the selected developer metadata to those entries associated with the specified location. This field either matches exact locations or all intersecting locations according the specified locationMatchingStrategy.
    metadataLocation: DeveloperMetadataLocationSchema,
    // Limits the selected developer metadata to that which has a matching DeveloperMetadata.metadata_value.
    metadataValue: []const u8,
    // Limits the selected developer metadata to that which has a matching DeveloperMetadata.visibility. If left unspecified, all developer metadata visibile to the requesting project is considered.
    visibility: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A group over an interval of rows or columns on a sheet, which can contain or be contained within other groups. A group can be collapsed or expanded as a unit on the sheet.
pub const DimensionGroupSchema = struct {
    const Self = @This();
    // This field is true if this group is collapsed. A collapsed group remains collapsed if an overlapping group at a shallower depth is expanded. A true value does not imply that all dimensions within the group are hidden, since a dimension's visibility can change independently from this group property. However, when this property is updated, all dimensions within it are set to hidden if this field is true, or set to visible if this field is false.
    collapsed: bool,
    // The depth of the group, representing how many groups have a range that wholly contains the range of this group.
    depth: i32,
    // The range over which this group exists.
    range: DimensionRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Properties about a dimension.
pub const DimensionPropertiesSchema = struct {
    const Self = @This();
    // Output only. If set, this is a column in a data source sheet.
    dataSourceColumnReference: DataSourceColumnReferenceSchema,
    // The developer metadata associated with a single row or column.
    developerMetadata: []const DeveloperMetadataSchema,
    // True if this dimension is being filtered. This field is read-only.
    hiddenByFilter: bool,
    // True if this dimension is explicitly hidden.
    hiddenByUser: bool,
    // The height (if a row) or width (if a column) of the dimension in pixels.
    pixelSize: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A range along a single dimension on a sheet. All indexes are zero-based. Indexes are half open: the start index is inclusive and the end index is exclusive. Missing indexes indicate the range is unbounded on that side.
pub const DimensionRangeSchema = struct {
    const Self = @This();
    // The dimension of the span.
    dimension: []const u8,
    // The end (exclusive) of the span, or not set if unbounded.
    endIndex: i32,
    // The sheet this span is on.
    sheetId: i32,
    // The start (inclusive) of the span, or not set if unbounded.
    startIndex: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Duplicates a particular filter view.
pub const DuplicateFilterViewRequestSchema = struct {
    const Self = @This();
    // The ID of the filter being duplicated.
    filterId: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The result of a filter view being duplicated.
pub const DuplicateFilterViewResponseSchema = struct {
    const Self = @This();
    // The newly created filter.
    filter: FilterViewSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Duplicates the contents of a sheet.
pub const DuplicateSheetRequestSchema = struct {
    const Self = @This();
    // The zero-based index where the new sheet should be inserted. The index of all sheets after this are incremented.
    insertSheetIndex: i32,
    // If set, the ID of the new sheet. If not set, an ID is chosen. If set, the ID must not conflict with any existing sheet ID. If set, it must be non-negative.
    newSheetId: i32,
    // The name of the new sheet. If empty, a new name is chosen for you.
    newSheetName: []const u8,
    // The sheet to duplicate. If the source sheet is of DATA_SOURCE type, its backing DataSource is also duplicated and associated with the new copy of the sheet. No data execution is triggered, the grid data of this sheet is also copied over but only available after the batch request completes.
    sourceSheetId: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The result of duplicating a sheet.
pub const DuplicateSheetResponseSchema = struct {
    const Self = @This();
    // The properties of the duplicate sheet.
    properties: SheetPropertiesSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The editors of a protected range.
pub const EditorsSchema = struct {
    const Self = @This();
    // True if anyone in the document's domain has edit access to the protected range. Domain protection is only supported on documents within a domain.
    domainUsersCanEdit: bool,
    // The email addresses of groups with edit access to the protected range.
    groups: []const []const u8,
    // The email addresses of users with edit access to the protected range.
    users: []const []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A chart embedded in a sheet.
pub const EmbeddedChartSchema = struct {
    const Self = @This();
    // The border of the chart.
    border: EmbeddedObjectBorderSchema,
    // The ID of the chart.
    chartId: i32,
    // The position of the chart.
    position: EmbeddedObjectPositionSchema,
    // The specification of the chart.
    spec: ChartSpecSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A border along an embedded object.
pub const EmbeddedObjectBorderSchema = struct {
    const Self = @This();
    // The color of the border. Deprecated: Use color_style.
    color: ColorSchema,
    // The color of the border. If color is also set, this field takes precedence.
    colorStyle: ColorStyleSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The position of an embedded object such as a chart.
pub const EmbeddedObjectPositionSchema = struct {
    const Self = @This();
    // If true, the embedded object is put on a new sheet whose ID is chosen for you. Used only when writing.
    newSheet: bool,
    // The position at which the object is overlaid on top of a grid.
    overlayPosition: OverlayPositionSchema,
    // The sheet this is on. Set only if the embedded object is on its own sheet. Must be non-negative.
    sheetId: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// An error in a cell.
pub const ErrorValueSchema = struct {
    const Self = @This();
    // A message with more information about the error (in the spreadsheet's locale).
    message: []const u8,
    // The type of error.
    type: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The kinds of value that a cell in a spreadsheet can have.
pub const ExtendedValueSchema = struct {
    const Self = @This();
    // Represents a boolean value.
    boolValue: bool,
    // Represents an error. This field is read-only.
    errorValue: ErrorValueSchema,
    // Represents a formula.
    formulaValue: []const u8,
    // Represents a double value. Note: Dates, Times and DateTimes are represented as doubles in SERIAL_NUMBER format.
    numberValue: f64,
    // Represents a string value. Leading single quotes are not included. For example, if the user typed `'123` into the UI, this would be represented as a `stringValue` of `"123"`.
    stringValue: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Criteria for showing/hiding rows in a filter or filter view.
pub const FilterCriteriaSchema = struct {
    const Self = @This();
    // A condition that must be true for values to be shown. (This does not override hidden_values -- if a value is listed there, it will still be hidden.)
    condition: BooleanConditionSchema,
    // Values that should be hidden.
    hiddenValues: []const []const u8,
    // The background fill color to filter by; only cells with this fill color are shown. Mutually exclusive with visible_foreground_color. Deprecated: Use visible_background_color_style.
    visibleBackgroundColor: ColorSchema,
    // The background fill color to filter by; only cells with this fill color are shown. This field is mutually exclusive with visible_foreground_color, and must be set to an RGB-type color. If visible_background_color is also set, this field takes precedence.
    visibleBackgroundColorStyle: ColorStyleSchema,
    // The foreground color to filter by; only cells with this foreground color are shown. Mutually exclusive with visible_background_color. Deprecated: Use visible_foreground_color_style.
    visibleForegroundColor: ColorSchema,
    // The foreground color to filter by; only cells with this foreground color are shown. This field is mutually exclusive with visible_background_color, and must be set to an RGB-type color. If visible_foreground_color is also set, this field takes precedence.
    visibleForegroundColorStyle: ColorStyleSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The filter criteria associated with a specific column.
pub const FilterSpecSchema = struct {
    const Self = @This();
    // The column index.
    columnIndex: i32,
    // Reference to a data source column.
    dataSourceColumnReference: DataSourceColumnReferenceSchema,
    // The criteria for the column.
    filterCriteria: FilterCriteriaSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A filter view.
pub const FilterViewSchema = struct {
    const Self = @This();
    // The criteria for showing/hiding values per column. The map's key is the column index, and the value is the criteria for that column. This field is deprecated in favor of filter_specs.
    criteria: StringHashMap(FilterCriteriaSchema),
    // The filter criteria for showing/hiding values per column. Both criteria and filter_specs are populated in responses. If both fields are specified in an update request, this field takes precedence.
    filterSpecs: []const FilterSpecSchema,
    // The ID of the filter view.
    filterViewId: i32,
    // The named range this filter view is backed by, if any. When writing, only one of range or named_range_id may be set.
    namedRangeId: []const u8,
    // The range this filter view covers. When writing, only one of range or named_range_id may be set.
    range: GridRangeSchema,
    // The sort order per column. Later specifications are used when values are equal in the earlier specifications.
    sortSpecs: []const SortSpecSchema,
    // The name of the filter view.
    title: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Finds and replaces data in cells over a range, sheet, or all sheets.
pub const FindReplaceRequestSchema = struct {
    const Self = @This();
    // True to find/replace over all sheets.
    allSheets: bool,
    // The value to search.
    find: []const u8,
    // True if the search should include cells with formulas. False to skip cells with formulas.
    includeFormulas: bool,
    // True if the search is case sensitive.
    matchCase: bool,
    // True if the find value should match the entire cell.
    matchEntireCell: bool,
    // The range to find/replace over.
    range: GridRangeSchema,
    // The value to use as the replacement.
    replacement: []const u8,
    // True if the find value is a regex. The regular expression and replacement should follow Java regex rules at https://docs.oracle.com/javase/8/docs/api/java/util/regex/Pattern.html. The replacement string is allowed to refer to capturing groups. For example, if one cell has the contents `"Google Sheets"` and another has `"Google Docs"`, then searching for `"o.* (.*)"` with a replacement of `"$1 Rocks"` would change the contents of the cells to `"GSheets Rocks"` and `"GDocs Rocks"` respectively.
    searchByRegex: bool,
    // The sheet to find/replace over.
    sheetId: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The result of the find/replace.
pub const FindReplaceResponseSchema = struct {
    const Self = @This();
    // The number of formula cells changed.
    formulasChanged: i32,
    // The number of occurrences (possibly multiple within a cell) changed. For example, if replacing `"e"` with `"o"` in `"Google Sheets"`, this would be `"3"` because `"Google Sheets"` -> `"Googlo Shoots"`.
    occurrencesChanged: i32,
    // The number of rows changed.
    rowsChanged: i32,
    // The number of sheets changed.
    sheetsChanged: i32,
    // The number of non-formula cells changed.
    valuesChanged: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The request for retrieving a Spreadsheet.
pub const GetSpreadsheetByDataFilterRequestSchema = struct {
    const Self = @This();
    // The DataFilters used to select which ranges to retrieve from the spreadsheet.
    dataFilters: []const DataFilterSchema,
    // True if grid data should be returned. This parameter is ignored if a field mask was set in the request.
    includeGridData: bool,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A rule that applies a gradient color scale format, based on the interpolation points listed. The format of a cell will vary based on its contents as compared to the values of the interpolation points.
pub const GradientRuleSchema = struct {
    const Self = @This();
    // The final interpolation point.
    maxpoint: InterpolationPointSchema,
    // An optional midway interpolation point.
    midpoint: InterpolationPointSchema,
    // The starting interpolation point.
    minpoint: InterpolationPointSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A coordinate in a sheet. All indexes are zero-based.
pub const GridCoordinateSchema = struct {
    const Self = @This();
    // The column index of the coordinate.
    columnIndex: i32,
    // The row index of the coordinate.
    rowIndex: i32,
    // The sheet this coordinate is on.
    sheetId: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Data in the grid, as well as metadata about the dimensions.
pub const GridDataSchema = struct {
    const Self = @This();
    // Metadata about the requested columns in the grid, starting with the column in start_column.
    columnMetadata: []const DimensionPropertiesSchema,
    // The data in the grid, one entry per row, starting with the row in startRow. The values in RowData will correspond to columns starting at start_column.
    rowData: []const RowDataSchema,
    // Metadata about the requested rows in the grid, starting with the row in start_row.
    rowMetadata: []const DimensionPropertiesSchema,
    // The first column this GridData refers to, zero-based.
    startColumn: i32,
    // The first row this GridData refers to, zero-based.
    startRow: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Properties of a grid.
pub const GridPropertiesSchema = struct {
    const Self = @This();
    // The number of columns in the grid.
    columnCount: i32,
    // True if the column grouping control toggle is shown after the group.
    columnGroupControlAfter: bool,
    // The number of columns that are frozen in the grid.
    frozenColumnCount: i32,
    // The number of rows that are frozen in the grid.
    frozenRowCount: i32,
    // True if the grid isn't showing gridlines in the UI.
    hideGridlines: bool,
    // The number of rows in the grid.
    rowCount: i32,
    // True if the row grouping control toggle is shown after the group.
    rowGroupControlAfter: bool,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A range on a sheet. All indexes are zero-based. Indexes are half open, i.e. the start index is inclusive and the end index is exclusive -- [start_index, end_index). Missing indexes indicate the range is unbounded on that side. For example, if `"Sheet1"` is sheet ID 123456, then: `Sheet1!A1:A1 == sheet_id: 123456, start_row_index: 0, end_row_index: 1, start_column_index: 0, end_column_index: 1` `Sheet1!A3:B4 == sheet_id: 123456, start_row_index: 2, end_row_index: 4, start_column_index: 0, end_column_index: 2` `Sheet1!A:B == sheet_id: 123456, start_column_index: 0, end_column_index: 2` `Sheet1!A5:B == sheet_id: 123456, start_row_index: 4, start_column_index: 0, end_column_index: 2` `Sheet1 == sheet_id: 123456` The start index must always be less than or equal to the end index. If the start index equals the end index, then the range is empty. Empty ranges are typically not meaningful and are usually rendered in the UI as `#REF!`.
pub const GridRangeSchema = struct {
    const Self = @This();
    // The end column (exclusive) of the range, or not set if unbounded.
    endColumnIndex: i32,
    // The end row (exclusive) of the range, or not set if unbounded.
    endRowIndex: i32,
    // The sheet this range is on.
    sheetId: i32,
    // The start column (inclusive) of the range, or not set if unbounded.
    startColumnIndex: i32,
    // The start row (inclusive) of the range, or not set if unbounded.
    startRowIndex: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A histogram chart. A histogram chart groups data items into bins, displaying each bin as a column of stacked items. Histograms are used to display the distribution of a dataset. Each column of items represents a range into which those items fall. The number of bins can be chosen automatically or specified explicitly.
pub const HistogramChartSpecSchema = struct {
    const Self = @This();
    // By default the bucket size (the range of values stacked in a single column) is chosen automatically, but it may be overridden here. E.g., A bucket size of 1.5 results in buckets from 0 - 1.5, 1.5 - 3.0, etc. Cannot be negative. This field is optional.
    bucketSize: f64,
    // The position of the chart legend.
    legendPosition: []const u8,
    // The outlier percentile is used to ensure that outliers do not adversely affect the calculation of bucket sizes. For example, setting an outlier percentile of 0.05 indicates that the top and bottom 5% of values when calculating buckets. The values are still included in the chart, they will be added to the first or last buckets instead of their own buckets. Must be between 0.0 and 0.5.
    outlierPercentile: f64,
    // The series for a histogram may be either a single series of values to be bucketed or multiple series, each of the same length, containing the name of the series followed by the values to be bucketed for that series.
    series: []const HistogramSeriesSchema,
    // Whether horizontal divider lines should be displayed between items in each column.
    showItemDividers: bool,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Allows you to organize the numeric values in a source data column into buckets of a constant size. All values from HistogramRule.start to HistogramRule.end are placed into groups of size HistogramRule.interval. In addition, all values below HistogramRule.start are placed in one group, and all values above HistogramRule.end are placed in another. Only HistogramRule.interval is required, though if HistogramRule.start and HistogramRule.end are both provided, HistogramRule.start must be less than HistogramRule.end. For example, a pivot table showing average purchase amount by age that has 50+ rows: +-----+-------------------+ | Age | AVERAGE of Amount | +-----+-------------------+ | 16 | $27.13 | | 17 | $5.24 | | 18 | $20.15 | ... +-----+-------------------+ could be turned into a pivot table that looks like the one below by applying a histogram group rule with a HistogramRule.start of 25, an HistogramRule.interval of 20, and an HistogramRule.end of 65. +-------------+-------------------+ | Grouped Age | AVERAGE of Amount | +-------------+-------------------+ | < 25 | $19.34 | | 25-45 | $31.43 | | 45-65 | $35.87 | | > 65 | $27.55 | +-------------+-------------------+ | Grand Total | $29.12 | +-------------+-------------------+
pub const HistogramRuleSchema = struct {
    const Self = @This();
    // The maximum value at which items are placed into buckets of constant size. Values above end are lumped into a single bucket. This field is optional.
    end: f64,
    // The size of the buckets that are created. Must be positive.
    interval: f64,
    // The minimum value at which items are placed into buckets of constant size. Values below start are lumped into a single bucket. This field is optional.
    start: f64,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A histogram series containing the series color and data.
pub const HistogramSeriesSchema = struct {
    const Self = @This();
    // The color of the column representing this series in each bucket. This field is optional. Deprecated: Use bar_color_style.
    barColor: ColorSchema,
    // The color of the column representing this series in each bucket. This field is optional. If bar_color is also set, this field takes precedence.
    barColorStyle: ColorStyleSchema,
    // The data for this histogram series.
    data: ChartDataSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Inserts rows or columns in a sheet at a particular index.
pub const InsertDimensionRequestSchema = struct {
    const Self = @This();
    // Whether dimension properties should be extended from the dimensions before or after the newly inserted dimensions. True to inherit from the dimensions before (in which case the start index must be greater than 0), and false to inherit from the dimensions after. For example, if row index 0 has red background and row index 1 has a green background, then inserting 2 rows at index 1 can inherit either the green or red background. If `inheritFromBefore` is true, the two new rows will be red (because the row before the insertion point was red), whereas if `inheritFromBefore` is false, the two new rows will be green (because the row after the insertion point was green).
    inheritFromBefore: bool,
    // The dimensions to insert. Both the start and end indexes must be bounded.
    range: DimensionRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Inserts cells into a range, shifting the existing cells over or down.
pub const InsertRangeRequestSchema = struct {
    const Self = @This();
    // The range to insert new cells into.
    range: GridRangeSchema,
    // The dimension which will be shifted when inserting cells. If ROWS, existing cells will be shifted down. If COLUMNS, existing cells will be shifted right.
    shiftDimension: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A single interpolation point on a gradient conditional format. These pin the gradient color scale according to the color, type and value chosen.
pub const InterpolationPointSchema = struct {
    const Self = @This();
    // The color this interpolation point should use. Deprecated: Use color_style.
    color: ColorSchema,
    // The color this interpolation point should use. If color is also set, this field takes precedence.
    colorStyle: ColorStyleSchema,
    // How the value should be interpreted.
    type: []const u8,
    // The value this interpolation point uses. May be a formula. Unused if type is MIN or MAX.
    value: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Represents a time interval, encoded as a Timestamp start (inclusive) and a Timestamp end (exclusive). The start must be less than or equal to the end. When the start equals the end, the interval is empty (matches no time). When both start and end are unspecified, the interval matches any time.
pub const IntervalSchema = struct {
    const Self = @This();
    // Optional. Exclusive end of the interval. If specified, a Timestamp matching this interval will have to be before the end.
    endTime: []const u8,
    // Optional. Inclusive start of the interval. If specified, a Timestamp matching this interval will have to be the same or after the start.
    startTime: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Settings to control how circular dependencies are resolved with iterative calculation.
pub const IterativeCalculationSettingsSchema = struct {
    const Self = @This();
    // When iterative calculation is enabled and successive results differ by less than this threshold value, the calculation rounds stop.
    convergenceThreshold: f64,
    // When iterative calculation is enabled, the maximum number of calculation rounds to perform.
    maxIterations: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Formatting options for key value.
pub const KeyValueFormatSchema = struct {
    const Self = @This();
    // Specifies the horizontal text positioning of key value. This field is optional. If not specified, default positioning is used.
    position: TextPositionSchema,
    // Text formatting options for key value. The link field is not supported.
    textFormat: TextFormatSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Properties that describe the style of a line.
pub const LineStyleSchema = struct {
    const Self = @This();
    // The dash type of the line.
    type: []const u8,
    // The thickness of the line, in px.
    width: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// An external or local reference.
pub const LinkSchema = struct {
    const Self = @This();
    // The link identifier.
    uri: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Allows you to manually organize the values in a source data column into buckets with names of your choosing. For example, a pivot table that aggregates population by state: +-------+-------------------+ | State | SUM of Population | +-------+-------------------+ | AK | 0.7 | | AL | 4.8 | | AR | 2.9 | ... +-------+-------------------+ could be turned into a pivot table that aggregates population by time zone by providing a list of groups (for example, groupName = 'Central', items = ['AL', 'AR', 'IA', ...]) to a manual group rule. Note that a similar effect could be achieved by adding a time zone column to the source data and adjusting the pivot table. +-----------+-------------------+ | Time Zone | SUM of Population | +-----------+-------------------+ | Central | 106.3 | | Eastern | 151.9 | | Mountain | 17.4 | ... +-----------+-------------------+
pub const ManualRuleSchema = struct {
    const Self = @This();
    // The list of group names and the corresponding items from the source data that map to each group name.
    groups: []const ManualRuleGroupSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A group name and a list of items from the source data that should be placed in the group with this name.
pub const ManualRuleGroupSchema = struct {
    const Self = @This();
    // The group name, which must be a string. Each group in a given ManualRule must have a unique group name.
    groupName: ExtendedValueSchema,
    // The items in the source data that should be placed into this group. Each item may be a string, number, or boolean. Items may appear in at most one group within a given ManualRule. Items that do not appear in any group will appear on their own.
    items: []const ExtendedValueSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A developer metadata entry and the data filters specified in the original request that matched it.
pub const MatchedDeveloperMetadataSchema = struct {
    const Self = @This();
    // All filters matching the returned developer metadata.
    dataFilters: []const DataFilterSchema,
    // The developer metadata matching the specified filters.
    developerMetadata: DeveloperMetadataSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A value range that was matched by one or more data filers.
pub const MatchedValueRangeSchema = struct {
    const Self = @This();
    // The DataFilters from the request that matched the range of values.
    dataFilters: []const DataFilterSchema,
    // The values matched by the DataFilter.
    valueRange: ValueRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Merges all cells in the range.
pub const MergeCellsRequestSchema = struct {
    const Self = @This();
    // How the cells should be merged.
    mergeType: []const u8,
    // The range of cells to merge.
    range: GridRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Moves one or more rows or columns.
pub const MoveDimensionRequestSchema = struct {
    const Self = @This();
    // The zero-based start index of where to move the source data to, based on the coordinates *before* the source data is removed from the grid. Existing data will be shifted down or right (depending on the dimension) to make room for the moved dimensions. The source dimensions are removed from the grid, so the the data may end up in a different index than specified. For example, given `A1..A5` of `0, 1, 2, 3, 4` and wanting to move `"1"` and `"2"` to between `"3"` and `"4"`, the source would be `ROWS [1..3)`,and the destination index would be `"4"` (the zero-based index of row 5). The end result would be `A1..A5` of `0, 3, 1, 2, 4`.
    destinationIndex: i32,
    // The source dimensions to move.
    source: DimensionRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A named range.
pub const NamedRangeSchema = struct {
    const Self = @This();
    // The name of the named range.
    name: []const u8,
    // The ID of the named range.
    namedRangeId: []const u8,
    // The range this represents.
    range: GridRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The number format of a cell.
pub const NumberFormatSchema = struct {
    const Self = @This();
    // Pattern string used for formatting. If not set, a default pattern based on the user's locale will be used if necessary for the given type. See the [Date and Number Formats guide](/sheets/api/guides/formats) for more information about the supported patterns.
    pattern: []const u8,
    // The type of the number format. When writing, this field must be set.
    type: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// An org chart. Org charts require a unique set of labels in labels and may optionally include parent_labels and tooltips. parent_labels contain, for each node, the label identifying the parent node. tooltips contain, for each node, an optional tooltip. For example, to describe an OrgChart with Alice as the CEO, Bob as the President (reporting to Alice) and Cathy as VP of Sales (also reporting to Alice), have labels contain "Alice", "Bob", "Cathy", parent_labels contain "", "Alice", "Alice" and tooltips contain "CEO", "President", "VP Sales".
pub const OrgChartSpecSchema = struct {
    const Self = @This();
    // The data containing the labels for all the nodes in the chart. Labels must be unique.
    labels: ChartDataSchema,
    // The color of the org chart nodes. Deprecated: Use node_color_style.
    nodeColor: ColorSchema,
    // The color of the org chart nodes. If node_color is also set, this field takes precedence.
    nodeColorStyle: ColorStyleSchema,
    // The size of the org chart nodes.
    nodeSize: []const u8,
    // The data containing the label of the parent for the corresponding node. A blank value indicates that the node has no parent and is a top-level node. This field is optional.
    parentLabels: ChartDataSchema,
    // The color of the selected org chart nodes. Deprecated: Use selected_node_color_style.
    selectedNodeColor: ColorSchema,
    // The color of the selected org chart nodes. If selected_node_color is also set, this field takes precedence.
    selectedNodeColorStyle: ColorStyleSchema,
    // The data containing the tooltip for the corresponding node. A blank value results in no tooltip being displayed for the node. This field is optional.
    tooltips: ChartDataSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The location an object is overlaid on top of a grid.
pub const OverlayPositionSchema = struct {
    const Self = @This();
    // The cell the object is anchored to.
    anchorCell: GridCoordinateSchema,
    // The height of the object, in pixels. Defaults to 371.
    heightPixels: i32,
    // The horizontal offset, in pixels, that the object is offset from the anchor cell.
    offsetXPixels: i32,
    // The vertical offset, in pixels, that the object is offset from the anchor cell.
    offsetYPixels: i32,
    // The width of the object, in pixels. Defaults to 600.
    widthPixels: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The amount of padding around the cell, in pixels. When updating padding, every field must be specified.
pub const PaddingSchema = struct {
    const Self = @This();
    // The bottom padding of the cell.
    bottom: i32,
    // The left padding of the cell.
    left: i32,
    // The right padding of the cell.
    right: i32,
    // The top padding of the cell.
    top: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Inserts data into the spreadsheet starting at the specified coordinate.
pub const PasteDataRequestSchema = struct {
    const Self = @This();
    // The coordinate at which the data should start being inserted.
    coordinate: GridCoordinateSchema,
    // The data to insert.
    data: []const u8,
    // The delimiter in the data.
    delimiter: []const u8,
    // True if the data is HTML.
    html: bool,
    // How the data should be pasted.
    type: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A pie chart.
pub const PieChartSpecSchema = struct {
    const Self = @This();
    // The data that covers the domain of the pie chart.
    domain: ChartDataSchema,
    // Where the legend of the pie chart should be drawn.
    legendPosition: []const u8,
    // The size of the hole in the pie chart.
    pieHole: f64,
    // The data that covers the one and only series of the pie chart.
    series: ChartDataSchema,
    // True if the pie is three dimensional.
    threeDimensional: bool,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Criteria for showing/hiding rows in a pivot table.
pub const PivotFilterCriteriaSchema = struct {
    const Self = @This();
    // A condition that must be true for values to be shown. (`visibleValues` does not override this -- even if a value is listed there, it is still hidden if it does not meet the condition.) Condition values that refer to ranges in A1-notation are evaluated relative to the pivot table sheet. References are treated absolutely, so are not filled down the pivot table. For example, a condition value of `=A1` on "Pivot Table 1" is treated as `'Pivot Table 1'!$A$1`. The source data of the pivot table can be referenced by column header name. For example, if the source data has columns named "Revenue" and "Cost" and a condition is applied to the "Revenue" column with type `NUMBER_GREATER` and value `=Cost`, then only columns where "Revenue" > "Cost" are included.
    condition: BooleanConditionSchema,
    // Whether values are visible by default. If true, the visible_values are ignored, all values that meet condition (if specified) are shown. If false, values that are both in visible_values and meet condition are shown.
    visibleByDefault: bool,
    // Values that should be included. Values not listed here are excluded.
    visibleValues: []const []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The pivot table filter criteria associated with a specific source column offset.
pub const PivotFilterSpecSchema = struct {
    const Self = @This();
    // The column offset of the source range.
    columnOffsetIndex: i32,
    // The reference to the data source column.
    dataSourceColumnReference: DataSourceColumnReferenceSchema,
    // The criteria for the column.
    filterCriteria: PivotFilterCriteriaSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A single grouping (either row or column) in a pivot table.
pub const PivotGroupSchema = struct {
    const Self = @This();
    // The reference to the data source column this grouping is based on.
    dataSourceColumnReference: DataSourceColumnReferenceSchema,
    // The count limit on rows or columns to apply to this pivot group.
    groupLimit: PivotGroupLimitSchema,
    // The group rule to apply to this row/column group.
    groupRule: PivotGroupRuleSchema,
    // The labels to use for the row/column groups which can be customized. For example, in the following pivot table, the row label is `Region` (which could be renamed to `State`) and the column label is `Product` (which could be renamed `Item`). Pivot tables created before December 2017 do not have header labels. If you'd like to add header labels to an existing pivot table, please delete the existing pivot table and then create a new pivot table with same parameters. +--------------+---------+-------+ | SUM of Units | Product | | | Region | Pen | Paper | +--------------+---------+-------+ | New York | 345 | 98 | | Oregon | 234 | 123 | | Tennessee | 531 | 415 | +--------------+---------+-------+ | Grand Total | 1110 | 636 | +--------------+---------+-------+
    label: []const u8,
    // True if the headings in this pivot group should be repeated. This is only valid for row groupings and is ignored by columns. By default, we minimize repetition of headings by not showing higher level headings where they are the same. For example, even though the third row below corresponds to "Q1 Mar", "Q1" is not shown because it is redundant with previous rows. Setting repeat_headings to true would cause "Q1" to be repeated for "Feb" and "Mar". +--------------+ | Q1 | Jan | | | Feb | | | Mar | +--------+-----+ | Q1 Total | +--------------+
    repeatHeadings: bool,
    // True if the pivot table should include the totals for this grouping.
    showTotals: bool,
    // The order the values in this group should be sorted.
    sortOrder: []const u8,
    // The column offset of the source range that this grouping is based on. For example, if the source was `C10:E15`, a `sourceColumnOffset` of `0` means this group refers to column `C`, whereas the offset `1` would refer to column `D`.
    sourceColumnOffset: i32,
    // The bucket of the opposite pivot group to sort by. If not specified, sorting is alphabetical by this group's values.
    valueBucket: PivotGroupSortValueBucketSchema,
    // Metadata about values in the grouping.
    valueMetadata: []const PivotGroupValueMetadataSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The count limit on rows or columns in the pivot group.
pub const PivotGroupLimitSchema = struct {
    const Self = @This();
    // The order in which the group limit is applied to the pivot table. Pivot group limits are applied from lower to higher order number. Order numbers are normalized to consecutive integers from 0. For write request, to fully customize the applying orders, all pivot group limits should have this field set with an unique number. Otherwise, the order is determined by the index in the PivotTable.rows list and then the PivotTable.columns list.
    applyOrder: i32,
    // The count limit.
    countLimit: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// An optional setting on a PivotGroup that defines buckets for the values in the source data column rather than breaking out each individual value. Only one PivotGroup with a group rule may be added for each column in the source data, though on any given column you may add both a PivotGroup that has a rule and a PivotGroup that does not.
pub const PivotGroupRuleSchema = struct {
    const Self = @This();
    // A DateTimeRule.
    dateTimeRule: DateTimeRuleSchema,
    // A HistogramRule.
    histogramRule: HistogramRuleSchema,
    // A ManualRule.
    manualRule: ManualRuleSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Information about which values in a pivot group should be used for sorting.
pub const PivotGroupSortValueBucketSchema = struct {
    const Self = @This();
    // Determines the bucket from which values are chosen to sort. For example, in a pivot table with one row group & two column groups, the row group can list up to two values. The first value corresponds to a value within the first column group, and the second value corresponds to a value in the second column group. If no values are listed, this would indicate that the row should be sorted according to the "Grand Total" over the column groups. If a single value is listed, this would correspond to using the "Total" of that bucket.
    buckets: []const ExtendedValueSchema,
    // The offset in the PivotTable.values list which the values in this grouping should be sorted by.
    valuesIndex: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Metadata about a value in a pivot grouping.
pub const PivotGroupValueMetadataSchema = struct {
    const Self = @This();
    // True if the data corresponding to the value is collapsed.
    collapsed: bool,
    // The calculated value the metadata corresponds to. (Note that formulaValue is not valid, because the values will be calculated.)
    value: ExtendedValueSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A pivot table.
pub const PivotTableSchema = struct {
    const Self = @This();
    // Each column grouping in the pivot table.
    columns: []const PivotGroupSchema,
    // An optional mapping of filters per source column offset. The filters are applied before aggregating data into the pivot table. The map's key is the column offset of the source range that you want to filter, and the value is the criteria for that column. For example, if the source was `C10:E15`, a key of `0` will have the filter for column `C`, whereas the key `1` is for column `D`. This field is deprecated in favor of filter_specs.
    criteria: StringHashMap(PivotFilterCriteriaSchema),
    // Output only. The data execution status for data source pivot tables.
    dataExecutionStatus: DataExecutionStatusSchema,
    // The ID of the data source the pivot table is reading data from.
    dataSourceId: []const u8,
    // The filters applied to the source columns before aggregating data for the pivot table. Both criteria and filter_specs are populated in responses. If both fields are specified in an update request, this field takes precedence.
    filterSpecs: []const PivotFilterSpecSchema,
    // Each row grouping in the pivot table.
    rows: []const PivotGroupSchema,
    // The range the pivot table is reading data from.
    source: GridRangeSchema,
    // Whether values should be listed horizontally (as columns) or vertically (as rows).
    valueLayout: []const u8,
    // A list of values to include in the pivot table.
    values: []const PivotValueSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The definition of how a value in a pivot table should be calculated.
pub const PivotValueSchema = struct {
    const Self = @This();
    // If specified, indicates that pivot values should be displayed as the result of a calculation with another pivot value. For example, if calculated_display_type is specified as PERCENT_OF_GRAND_TOTAL, all the pivot values are displayed as the percentage of the grand total. In the Sheets editor, this is referred to as "Show As" in the value section of a pivot table.
    calculatedDisplayType: []const u8,
    // The reference to the data source column that this value reads from.
    dataSourceColumnReference: DataSourceColumnReferenceSchema,
    // A custom formula to calculate the value. The formula must start with an `=` character.
    formula: []const u8,
    // A name to use for the value.
    name: []const u8,
    // The column offset of the source range that this value reads from. For example, if the source was `C10:E15`, a `sourceColumnOffset` of `0` means this value refers to column `C`, whereas the offset `1` would refer to column `D`.
    sourceColumnOffset: i32,
    // A function to summarize the value. If formula is set, the only supported values are SUM and CUSTOM. If sourceColumnOffset is set, then `CUSTOM` is not supported.
    summarizeFunction: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The style of a point on the chart.
pub const PointStyleSchema = struct {
    const Self = @This();
    // The point shape. If empty or unspecified, a default shape is used.
    shape: []const u8,
    // The point size. If empty, a default size is used.
    size: f64,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A protected range.
pub const ProtectedRangeSchema = struct {
    const Self = @This();
    // The description of this protected range.
    description: []const u8,
    // The users and groups with edit access to the protected range. This field is only visible to users with edit access to the protected range and the document. Editors are not supported with warning_only protection.
    editors: EditorsSchema,
    // The named range this protected range is backed by, if any. When writing, only one of range or named_range_id may be set.
    namedRangeId: []const u8,
    // The ID of the protected range. This field is read-only.
    protectedRangeId: i32,
    // The range that is being protected. The range may be fully unbounded, in which case this is considered a protected sheet. When writing, only one of range or named_range_id may be set.
    range: GridRangeSchema,
    // True if the user who requested this protected range can edit the protected area. This field is read-only.
    requestingUserCanEdit: bool,
    // The list of unprotected ranges within a protected sheet. Unprotected ranges are only supported on protected sheets.
    unprotectedRanges: []const GridRangeSchema,
    // True if this protected range will show a warning when editing. Warning-based protection means that every user can edit data in the protected range, except editing will prompt a warning asking the user to confirm the edit. When writing: if this field is true, then editors is ignored. Additionally, if this field is changed from true to false and the `editors` field is not set (nor included in the field mask), then the editors will be set to all the editors in the document.
    warningOnly: bool,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Randomizes the order of the rows in a range.
pub const RandomizeRangeRequestSchema = struct {
    const Self = @This();
    // The range to randomize.
    range: GridRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The execution status of refreshing one data source object.
pub const RefreshDataSourceObjectExecutionStatusSchema = struct {
    const Self = @This();
    // The data execution status.
    dataExecutionStatus: DataExecutionStatusSchema,
    // Reference to a data source object being refreshed.
    reference: DataSourceObjectReferenceSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Refreshes one or multiple data source objects in the spreadsheet by the specified references. The request requires an additional `bigquery.readonly` OAuth scope. If there are multiple refresh requests referencing the same data source objects in one batch, only the last refresh request is processed, and all those requests will have the same response accordingly.
pub const RefreshDataSourceRequestSchema = struct {
    const Self = @This();
    // Reference to a DataSource. If specified, refreshes all associated data source objects for the data source.
    dataSourceId: []const u8,
    // Refreshes the data source objects regardless of the current state. If not set and a referenced data source object was in error state, the refresh will fail immediately.
    force: bool,
    // Refreshes all existing data source objects in the spreadsheet.
    isAll: bool,
    // References to data source objects to refresh.
    references: DataSourceObjectReferencesSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The response from refreshing one or multiple data source objects.
pub const RefreshDataSourceResponseSchema = struct {
    const Self = @This();
    // All the refresh status for the data source object references specified in the request. If is_all is specified, the field contains only those in failure status.
    statuses: []const RefreshDataSourceObjectExecutionStatusSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Updates all cells in the range to the values in the given Cell object. Only the fields listed in the fields field are updated; others are unchanged. If writing a cell with a formula, the formula's ranges will automatically increment for each field in the range. For example, if writing a cell with formula `=A1` into range B2:C4, B2 would be `=A1`, B3 would be `=A2`, B4 would be `=A3`, C2 would be `=B1`, C3 would be `=B2`, C4 would be `=B3`. To keep the formula's ranges static, use the `$` indicator. For example, use the formula `=$A$1` to prevent both the row and the column from incrementing.
pub const RepeatCellRequestSchema = struct {
    const Self = @This();
    // The data to write.
    cell: CellDataSchema,
    // The fields that should be updated. At least one field must be specified. The root `cell` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field.
    fields: []const u8,
    // The range to repeat the cell in.
    range: GridRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A single kind of update to apply to a spreadsheet.
pub const RequestSchema = struct {
    const Self = @This();
    // Adds a new banded range
    addBanding: AddBandingRequestSchema,
    // Adds a chart.
    addChart: AddChartRequestSchema,
    // Adds a new conditional format rule.
    addConditionalFormatRule: AddConditionalFormatRuleRequestSchema,
    // Adds a data source.
    addDataSource: AddDataSourceRequestSchema,
    // Creates a group over the specified range.
    addDimensionGroup: AddDimensionGroupRequestSchema,
    // Adds a filter view.
    addFilterView: AddFilterViewRequestSchema,
    // Adds a named range.
    addNamedRange: AddNamedRangeRequestSchema,
    // Adds a protected range.
    addProtectedRange: AddProtectedRangeRequestSchema,
    // Adds a sheet.
    addSheet: AddSheetRequestSchema,
    // Adds a slicer.
    addSlicer: AddSlicerRequestSchema,
    // Appends cells after the last row with data in a sheet.
    appendCells: AppendCellsRequestSchema,
    // Appends dimensions to the end of a sheet.
    appendDimension: AppendDimensionRequestSchema,
    // Automatically fills in more data based on existing data.
    autoFill: AutoFillRequestSchema,
    // Automatically resizes one or more dimensions based on the contents of the cells in that dimension.
    autoResizeDimensions: AutoResizeDimensionsRequestSchema,
    // Clears the basic filter on a sheet.
    clearBasicFilter: ClearBasicFilterRequestSchema,
    // Copies data from one area and pastes it to another.
    copyPaste: CopyPasteRequestSchema,
    // Creates new developer metadata
    createDeveloperMetadata: CreateDeveloperMetadataRequestSchema,
    // Cuts data from one area and pastes it to another.
    cutPaste: CutPasteRequestSchema,
    // Removes a banded range
    deleteBanding: DeleteBandingRequestSchema,
    // Deletes an existing conditional format rule.
    deleteConditionalFormatRule: DeleteConditionalFormatRuleRequestSchema,
    // Deletes a data source.
    deleteDataSource: DeleteDataSourceRequestSchema,
    // Deletes developer metadata
    deleteDeveloperMetadata: DeleteDeveloperMetadataRequestSchema,
    // Deletes rows or columns in a sheet.
    deleteDimension: DeleteDimensionRequestSchema,
    // Deletes a group over the specified range.
    deleteDimensionGroup: DeleteDimensionGroupRequestSchema,
    // Removes rows containing duplicate values in specified columns of a cell range.
    deleteDuplicates: DeleteDuplicatesRequestSchema,
    // Deletes an embedded object (e.g, chart, image) in a sheet.
    deleteEmbeddedObject: DeleteEmbeddedObjectRequestSchema,
    // Deletes a filter view from a sheet.
    deleteFilterView: DeleteFilterViewRequestSchema,
    // Deletes a named range.
    deleteNamedRange: DeleteNamedRangeRequestSchema,
    // Deletes a protected range.
    deleteProtectedRange: DeleteProtectedRangeRequestSchema,
    // Deletes a range of cells from a sheet, shifting the remaining cells.
    deleteRange: DeleteRangeRequestSchema,
    // Deletes a sheet.
    deleteSheet: DeleteSheetRequestSchema,
    // Duplicates a filter view.
    duplicateFilterView: DuplicateFilterViewRequestSchema,
    // Duplicates a sheet.
    duplicateSheet: DuplicateSheetRequestSchema,
    // Finds and replaces occurrences of some text with other text.
    findReplace: FindReplaceRequestSchema,
    // Inserts new rows or columns in a sheet.
    insertDimension: InsertDimensionRequestSchema,
    // Inserts new cells in a sheet, shifting the existing cells.
    insertRange: InsertRangeRequestSchema,
    // Merges cells together.
    mergeCells: MergeCellsRequestSchema,
    // Moves rows or columns to another location in a sheet.
    moveDimension: MoveDimensionRequestSchema,
    // Pastes data (HTML or delimited) into a sheet.
    pasteData: PasteDataRequestSchema,
    // Randomizes the order of the rows in a range.
    randomizeRange: RandomizeRangeRequestSchema,
    // Refreshs one or multiple data sources and associated dbobjects.
    refreshDataSource: RefreshDataSourceRequestSchema,
    // Repeats a single cell across a range.
    repeatCell: RepeatCellRequestSchema,
    // Sets the basic filter on a sheet.
    setBasicFilter: SetBasicFilterRequestSchema,
    // Sets data validation for one or more cells.
    setDataValidation: SetDataValidationRequestSchema,
    // Sorts data in a range.
    sortRange: SortRangeRequestSchema,
    // Converts a column of text into many columns of text.
    textToColumns: TextToColumnsRequestSchema,
    // Trims cells of whitespace (such as spaces, tabs, or new lines).
    trimWhitespace: TrimWhitespaceRequestSchema,
    // Unmerges merged cells.
    unmergeCells: UnmergeCellsRequestSchema,
    // Updates a banded range
    updateBanding: UpdateBandingRequestSchema,
    // Updates the borders in a range of cells.
    updateBorders: UpdateBordersRequestSchema,
    // Updates many cells at once.
    updateCells: UpdateCellsRequestSchema,
    // Updates a chart's specifications.
    updateChartSpec: UpdateChartSpecRequestSchema,
    // Updates an existing conditional format rule.
    updateConditionalFormatRule: UpdateConditionalFormatRuleRequestSchema,
    // Updates a data source.
    updateDataSource: UpdateDataSourceRequestSchema,
    // Updates an existing developer metadata entry
    updateDeveloperMetadata: UpdateDeveloperMetadataRequestSchema,
    // Updates the state of the specified group.
    updateDimensionGroup: UpdateDimensionGroupRequestSchema,
    // Updates dimensions' properties.
    updateDimensionProperties: UpdateDimensionPropertiesRequestSchema,
    // Updates an embedded object's border.
    updateEmbeddedObjectBorder: UpdateEmbeddedObjectBorderRequestSchema,
    // Updates an embedded object's (e.g. chart, image) position.
    updateEmbeddedObjectPosition: UpdateEmbeddedObjectPositionRequestSchema,
    // Updates the properties of a filter view.
    updateFilterView: UpdateFilterViewRequestSchema,
    // Updates a named range.
    updateNamedRange: UpdateNamedRangeRequestSchema,
    // Updates a protected range.
    updateProtectedRange: UpdateProtectedRangeRequestSchema,
    // Updates a sheet's properties.
    updateSheetProperties: UpdateSheetPropertiesRequestSchema,
    // Updates a slicer's specifications.
    updateSlicerSpec: UpdateSlicerSpecRequestSchema,
    // Updates the spreadsheet's properties.
    updateSpreadsheetProperties: UpdateSpreadsheetPropertiesRequestSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A single response from an update.
pub const ResponseSchema = struct {
    const Self = @This();
    // A reply from adding a banded range.
    addBanding: AddBandingResponseSchema,
    // A reply from adding a chart.
    addChart: AddChartResponseSchema,
    // A reply from adding a data source.
    addDataSource: AddDataSourceResponseSchema,
    // A reply from adding a dimension group.
    addDimensionGroup: AddDimensionGroupResponseSchema,
    // A reply from adding a filter view.
    addFilterView: AddFilterViewResponseSchema,
    // A reply from adding a named range.
    addNamedRange: AddNamedRangeResponseSchema,
    // A reply from adding a protected range.
    addProtectedRange: AddProtectedRangeResponseSchema,
    // A reply from adding a sheet.
    addSheet: AddSheetResponseSchema,
    // A reply from adding a slicer.
    addSlicer: AddSlicerResponseSchema,
    // A reply from creating a developer metadata entry.
    createDeveloperMetadata: CreateDeveloperMetadataResponseSchema,
    // A reply from deleting a conditional format rule.
    deleteConditionalFormatRule: DeleteConditionalFormatRuleResponseSchema,
    // A reply from deleting a developer metadata entry.
    deleteDeveloperMetadata: DeleteDeveloperMetadataResponseSchema,
    // A reply from deleting a dimension group.
    deleteDimensionGroup: DeleteDimensionGroupResponseSchema,
    // A reply from removing rows containing duplicate values.
    deleteDuplicates: DeleteDuplicatesResponseSchema,
    // A reply from duplicating a filter view.
    duplicateFilterView: DuplicateFilterViewResponseSchema,
    // A reply from duplicating a sheet.
    duplicateSheet: DuplicateSheetResponseSchema,
    // A reply from doing a find/replace.
    findReplace: FindReplaceResponseSchema,
    // A reply from refreshing data source objects.
    refreshDataSource: RefreshDataSourceResponseSchema,
    // A reply from trimming whitespace.
    trimWhitespace: TrimWhitespaceResponseSchema,
    // A reply from updating a conditional format rule.
    updateConditionalFormatRule: UpdateConditionalFormatRuleResponseSchema,
    // A reply from updating a data source.
    updateDataSource: UpdateDataSourceResponseSchema,
    // A reply from updating a developer metadata entry.
    updateDeveloperMetadata: UpdateDeveloperMetadataResponseSchema,
    // A reply from updating an embedded object's position.
    updateEmbeddedObjectPosition: UpdateEmbeddedObjectPositionResponseSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Data about each cell in a row.
pub const RowDataSchema = struct {
    const Self = @This();
    // The values in the row, one per column.
    values: []const CellDataSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A scorecard chart. Scorecard charts are used to highlight key performance indicators, known as KPIs, on the spreadsheet. A scorecard chart can represent things like total sales, average cost, or a top selling item. You can specify a single data value, or aggregate over a range of data. Percentage or absolute difference from a baseline value can be highlighted, like changes over time.
pub const ScorecardChartSpecSchema = struct {
    const Self = @This();
    // The aggregation type for key and baseline chart data in scorecard chart. This field is not supported for data source charts. Use the ChartData.aggregateType field of the key_value_data or baseline_value_data instead for data source charts. This field is optional.
    aggregateType: []const u8,
    // The data for scorecard baseline value. This field is optional.
    baselineValueData: ChartDataSchema,
    // Formatting options for baseline value. This field is needed only if baseline_value_data is specified.
    baselineValueFormat: BaselineValueFormatSchema,
    // Custom formatting options for numeric key/baseline values in scorecard chart. This field is used only when number_format_source is set to CUSTOM. This field is optional.
    customFormatOptions: ChartCustomNumberFormatOptionsSchema,
    // The data for scorecard key value.
    keyValueData: ChartDataSchema,
    // Formatting options for key value.
    keyValueFormat: KeyValueFormatSchema,
    // The number format source used in the scorecard chart. This field is optional.
    numberFormatSource: []const u8,
    // Value to scale scorecard key and baseline value. For example, a factor of 10 can be used to divide all values in the chart by 10. This field is optional.
    scaleFactor: f64,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A request to retrieve all developer metadata matching the set of specified criteria.
pub const SearchDeveloperMetadataRequestSchema = struct {
    const Self = @This();
    // The data filters describing the criteria used to determine which DeveloperMetadata entries to return. DeveloperMetadata matching any of the specified filters are included in the response.
    dataFilters: []const DataFilterSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A reply to a developer metadata search request.
pub const SearchDeveloperMetadataResponseSchema = struct {
    const Self = @This();
    // The metadata matching the criteria of the search request.
    matchedDeveloperMetadata: []const MatchedDeveloperMetadataSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Sets the basic filter associated with a sheet.
pub const SetBasicFilterRequestSchema = struct {
    const Self = @This();
    // The filter to set.
    filter: BasicFilterSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Sets a data validation rule to every cell in the range. To clear validation in a range, call this with no rule specified.
pub const SetDataValidationRequestSchema = struct {
    const Self = @This();
    // The range the data validation rule should apply to.
    range: GridRangeSchema,
    // The data validation rule to set on each cell in the range, or empty to clear the data validation in the range.
    rule: DataValidationRuleSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A sheet in a spreadsheet.
pub const SheetSchema = struct {
    const Self = @This();
    // The banded (alternating colors) ranges on this sheet.
    bandedRanges: []const BandedRangeSchema,
    // The filter on this sheet, if any.
    basicFilter: BasicFilterSchema,
    // The specifications of every chart on this sheet.
    charts: []const EmbeddedChartSchema,
    // All column groups on this sheet, ordered by increasing range start index, then by group depth.
    columnGroups: []const DimensionGroupSchema,
    // The conditional format rules in this sheet.
    conditionalFormats: []const ConditionalFormatRuleSchema,
    // Data in the grid, if this is a grid sheet. The number of GridData objects returned is dependent on the number of ranges requested on this sheet. For example, if this is representing `Sheet1`, and the spreadsheet was requested with ranges `Sheet1!A1:C10` and `Sheet1!D15:E20`, then the first GridData will have a startRow/startColumn of `0`, while the second one will have `startRow 14` (zero-based row 15), and `startColumn 3` (zero-based column D). For a DATA_SOURCE sheet, you can not request a specific range, the GridData contains all the values.
    data: []const GridDataSchema,
    // The developer metadata associated with a sheet.
    developerMetadata: []const DeveloperMetadataSchema,
    // The filter views in this sheet.
    filterViews: []const FilterViewSchema,
    // The ranges that are merged together.
    merges: []const GridRangeSchema,
    // The properties of the sheet.
    properties: SheetPropertiesSchema,
    // The protected ranges in this sheet.
    protectedRanges: []const ProtectedRangeSchema,
    // All row groups on this sheet, ordered by increasing range start index, then by group depth.
    rowGroups: []const DimensionGroupSchema,
    // The slicers on this sheet.
    slicers: []const SlicerSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Properties of a sheet.
pub const SheetPropertiesSchema = struct {
    const Self = @This();
    // Output only. If present, the field contains DATA_SOURCE sheet specific properties.
    dataSourceSheetProperties: DataSourceSheetPropertiesSchema,
    // Additional properties of the sheet if this sheet is a grid. (If the sheet is an object sheet, containing a chart or image, then this field will be absent.) When writing it is an error to set any grid properties on non-grid sheets. If this sheet is a DATA_SOURCE sheet, this field is output only but contains the properties that reflect how a data source sheet is rendered in the UI, e.g. row_count.
    gridProperties: GridPropertiesSchema,
    // True if the sheet is hidden in the UI, false if it's visible.
    hidden: bool,
    // The index of the sheet within the spreadsheet. When adding or updating sheet properties, if this field is excluded then the sheet is added or moved to the end of the sheet list. When updating sheet indices or inserting sheets, movement is considered in "before the move" indexes. For example, if there were 3 sheets (S1, S2, S3) in order to move S1 ahead of S2 the index would have to be set to 2. A sheet index update request is ignored if the requested index is identical to the sheets current index or if the requested new index is equal to the current sheet index + 1.
    index: i32,
    // True if the sheet is an RTL sheet instead of an LTR sheet.
    rightToLeft: bool,
    // The ID of the sheet. Must be non-negative. This field cannot be changed once set.
    sheetId: i32,
    // The type of sheet. Defaults to GRID. This field cannot be changed once set.
    sheetType: []const u8,
    // The color of the tab in the UI. Deprecated: Use tab_color_style.
    tabColor: ColorSchema,
    // The color of the tab in the UI. If tab_color is also set, this field takes precedence.
    tabColorStyle: ColorStyleSchema,
    // The name of the sheet.
    title: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A slicer in a sheet.
pub const SlicerSchema = struct {
    const Self = @This();
    // The position of the slicer. Note that slicer can be positioned only on existing sheet. Also, width and height of slicer can be automatically adjusted to keep it within permitted limits.
    position: EmbeddedObjectPositionSchema,
    // The ID of the slicer.
    slicerId: i32,
    // The specification of the slicer.
    spec: SlicerSpecSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The specifications of a slicer.
pub const SlicerSpecSchema = struct {
    const Self = @This();
    // True if the filter should apply to pivot tables. If not set, default to `True`.
    applyToPivotTables: bool,
    // The background color of the slicer. Deprecated: Use background_color_style.
    backgroundColor: ColorSchema,
    // The background color of the slicer. If background_color is also set, this field takes precedence.
    backgroundColorStyle: ColorStyleSchema,
    // The column index in the data table on which the filter is applied to.
    columnIndex: i32,
    // The data range of the slicer.
    dataRange: GridRangeSchema,
    // The filtering criteria of the slicer.
    filterCriteria: FilterCriteriaSchema,
    // The horizontal alignment of title in the slicer. If unspecified, defaults to `LEFT`
    horizontalAlignment: []const u8,
    // The text format of title in the slicer. The link field is not supported.
    textFormat: TextFormatSchema,
    // The title of the slicer.
    title: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Sorts data in rows based on a sort order per column.
pub const SortRangeRequestSchema = struct {
    const Self = @This();
    // The range to sort.
    range: GridRangeSchema,
    // The sort order per column. Later specifications are used when values are equal in the earlier specifications.
    sortSpecs: []const SortSpecSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A sort order associated with a specific column or row.
pub const SortSpecSchema = struct {
    const Self = @This();
    // The background fill color to sort by; cells with this fill color are sorted to the top. Mutually exclusive with foreground_color. Deprecated: Use background_color_style.
    backgroundColor: ColorSchema,
    // The background fill color to sort by; cells with this fill color are sorted to the top. Mutually exclusive with foreground_color, and must be an RGB-type color. If background_color is also set, this field takes precedence.
    backgroundColorStyle: ColorStyleSchema,
    // Reference to a data source column.
    dataSourceColumnReference: DataSourceColumnReferenceSchema,
    // The dimension the sort should be applied to.
    dimensionIndex: i32,
    // The foreground color to sort by; cells with this foreground color are sorted to the top. Mutually exclusive with background_color. Deprecated: Use foreground_color_style.
    foregroundColor: ColorSchema,
    // The foreground color to sort by; cells with this foreground color are sorted to the top. Mutually exclusive with background_color, and must be an RGB-type color. If foreground_color is also set, this field takes precedence.
    foregroundColorStyle: ColorStyleSchema,
    // The order data should be sorted.
    sortOrder: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A combination of a source range and how to extend that source.
pub const SourceAndDestinationSchema = struct {
    const Self = @This();
    // The dimension that data should be filled into.
    dimension: []const u8,
    // The number of rows or columns that data should be filled into. Positive numbers expand beyond the last row or last column of the source. Negative numbers expand before the first row or first column of the source.
    fillLength: i32,
    // The location of the data to use as the source of the autofill.
    source: GridRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Resource that represents a spreadsheet.
pub const SpreadsheetSchema = struct {
    const Self = @This();
    // Output only. A list of data source refresh schedules.
    dataSourceSchedules: []const DataSourceRefreshScheduleSchema,
    // A list of external data sources connected with the spreadsheet.
    dataSources: []const DataSourceSchema,
    // The developer metadata associated with a spreadsheet.
    developerMetadata: []const DeveloperMetadataSchema,
    // The named ranges defined in a spreadsheet.
    namedRanges: []const NamedRangeSchema,
    // Overall properties of a spreadsheet.
    properties: SpreadsheetPropertiesSchema,
    // The sheets that are part of a spreadsheet.
    sheets: []const SheetSchema,
    // The ID of the spreadsheet. This field is read-only.
    spreadsheetId: []const u8,
    // The url of the spreadsheet. This field is read-only.
    spreadsheetUrl: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Properties of a spreadsheet.
pub const SpreadsheetPropertiesSchema = struct {
    const Self = @This();
    // The amount of time to wait before volatile functions are recalculated.
    autoRecalc: []const u8,
    // The default format of all cells in the spreadsheet. CellData.effectiveFormat will not be set if the cell's format is equal to this default format. This field is read-only.
    defaultFormat: CellFormatSchema,
    // Determines whether and how circular references are resolved with iterative calculation. Absence of this field means that circular references result in calculation errors.
    iterativeCalculationSettings: IterativeCalculationSettingsSchema,
    // The locale of the spreadsheet in one of the following formats: * an ISO 639-1 language code such as `en` * an ISO 639-2 language code such as `fil`, if no 639-1 code exists * a combination of the ISO language code and country code, such as `en_US` Note: when updating this field, not all locales/languages are supported.
    locale: []const u8,
    // Theme applied to the spreadsheet.
    spreadsheetTheme: SpreadsheetThemeSchema,
    // The time zone of the spreadsheet, in CLDR format such as `America/New_York`. If the time zone isn't recognized, this may be a custom time zone such as `GMT-07:00`.
    timeZone: []const u8,
    // The title of the spreadsheet.
    title: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Represents spreadsheet theme
pub const SpreadsheetThemeSchema = struct {
    const Self = @This();
    // Name of the primary font family.
    primaryFontFamily: []const u8,
    // The spreadsheet theme color pairs. To update you must provide all theme color pairs.
    themeColors: []const ThemeColorPairSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The format of a run of text in a cell. Absent values indicate that the field isn't specified.
pub const TextFormatSchema = struct {
    const Self = @This();
    // True if the text is bold.
    bold: bool,
    // The font family.
    fontFamily: []const u8,
    // The size of the font.
    fontSize: i32,
    // The foreground color of the text. Deprecated: Use foreground_color_style.
    foregroundColor: ColorSchema,
    // The foreground color of the text. If foreground_color is also set, this field takes precedence.
    foregroundColorStyle: ColorStyleSchema,
    // True if the text is italicized.
    italic: bool,
    // The link destination of the text, if any. Setting the link field in a TextFormatRun will clear the cell's existing links or a cell-level link set in the same request. When a link is set, the text foreground color will be set to the default link color and the text will be underlined. If these fields are modified in the same request, those values will be used instead of the link defaults.
    link: LinkSchema,
    // True if the text has a strikethrough.
    strikethrough: bool,
    // True if the text is underlined.
    underline: bool,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A run of a text format. The format of this run continues until the start index of the next run. When updating, all fields must be set.
pub const TextFormatRunSchema = struct {
    const Self = @This();
    // The format of this run. Absent values inherit the cell's format.
    format: TextFormatSchema,
    // The character index where this run starts.
    startIndex: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Position settings for text.
pub const TextPositionSchema = struct {
    const Self = @This();
    // Horizontal alignment setting for the piece of text.
    horizontalAlignment: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The rotation applied to text in a cell.
pub const TextRotationSchema = struct {
    const Self = @This();
    // The angle between the standard orientation and the desired orientation. Measured in degrees. Valid values are between -90 and 90. Positive angles are angled upwards, negative are angled downwards. Note: For LTR text direction positive angles are in the counterclockwise direction, whereas for RTL they are in the clockwise direction
    angle: i32,
    // If true, text reads top to bottom, but the orientation of individual characters is unchanged. For example: | V | | e | | r | | t | | i | | c | | a | | l |
    vertical: bool,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Splits a column of text into multiple columns, based on a delimiter in each cell.
pub const TextToColumnsRequestSchema = struct {
    const Self = @This();
    // The delimiter to use. Used only if delimiterType is CUSTOM.
    delimiter: []const u8,
    // The delimiter type to use.
    delimiterType: []const u8,
    // The source data range. This must span exactly one column.
    source: GridRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A pair mapping a spreadsheet theme color type to the concrete color it represents.
pub const ThemeColorPairSchema = struct {
    const Self = @This();
    // The concrete color corresponding to the theme color type.
    color: ColorStyleSchema,
    // The type of the spreadsheet theme color.
    colorType: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Represents a time of day. The date and time zone are either not significant or are specified elsewhere. An API may choose to allow leap seconds. Related types are google.type.Date and `google.protobuf.Timestamp`.
pub const TimeOfDaySchema = struct {
    const Self = @This();
    // Hours of day in 24 hour format. Should be from 0 to 23. An API may choose to allow the value "24:00:00" for scenarios like business closing time.
    hours: i32,
    // Minutes of hour of day. Must be from 0 to 59.
    minutes: i32,
    // Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999.
    nanos: i32,
    // Seconds of minutes of the time. Must normally be from 0 to 59. An API may allow the value 60 if it allows leap-seconds.
    seconds: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A color scale for a treemap chart.
pub const TreemapChartColorScaleSchema = struct {
    const Self = @This();
    // The background color for cells with a color value greater than or equal to maxValue. Defaults to #109618 if not specified. Deprecated: Use max_value_color_style.
    maxValueColor: ColorSchema,
    // The background color for cells with a color value greater than or equal to maxValue. Defaults to #109618 if not specified. If max_value_color is also set, this field takes precedence.
    maxValueColorStyle: ColorStyleSchema,
    // The background color for cells with a color value at the midpoint between minValue and maxValue. Defaults to #efe6dc if not specified. Deprecated: Use mid_value_color_style.
    midValueColor: ColorSchema,
    // The background color for cells with a color value at the midpoint between minValue and maxValue. Defaults to #efe6dc if not specified. If mid_value_color is also set, this field takes precedence.
    midValueColorStyle: ColorStyleSchema,
    // The background color for cells with a color value less than or equal to minValue. Defaults to #dc3912 if not specified. Deprecated: Use min_value_color_style.
    minValueColor: ColorSchema,
    // The background color for cells with a color value less than or equal to minValue. Defaults to #dc3912 if not specified. If min_value_color is also set, this field takes precedence.
    minValueColorStyle: ColorStyleSchema,
    // The background color for cells that have no color data associated with them. Defaults to #000000 if not specified. Deprecated: Use no_data_color_style.
    noDataColor: ColorSchema,
    // The background color for cells that have no color data associated with them. Defaults to #000000 if not specified. If no_data_color is also set, this field takes precedence.
    noDataColorStyle: ColorStyleSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A Treemap chart.
pub const TreemapChartSpecSchema = struct {
    const Self = @This();
    // The data that determines the background color of each treemap data cell. This field is optional. If not specified, size_data is used to determine background colors. If specified, the data is expected to be numeric. color_scale will determine how the values in this data map to data cell background colors.
    colorData: ChartDataSchema,
    // The color scale for data cells in the treemap chart. Data cells are assigned colors based on their color values. These color values come from color_data, or from size_data if color_data is not specified. Cells with color values less than or equal to min_value will have minValueColor as their background color. Cells with color values greater than or equal to max_value will have maxValueColor as their background color. Cells with color values between min_value and max_value will have background colors on a gradient between minValueColor and maxValueColor, the midpoint of the gradient being midValueColor. Cells with missing or non-numeric color values will have noDataColor as their background color.
    colorScale: TreemapChartColorScaleSchema,
    // The background color for header cells. Deprecated: Use header_color_style.
    headerColor: ColorSchema,
    // The background color for header cells. If header_color is also set, this field takes precedence.
    headerColorStyle: ColorStyleSchema,
    // True to hide tooltips.
    hideTooltips: bool,
    // The number of additional data levels beyond the labeled levels to be shown on the treemap chart. These levels are not interactive and are shown without their labels. Defaults to 0 if not specified.
    hintedLevels: i32,
    // The data that contains the treemap cell labels.
    labels: ChartDataSchema,
    // The number of data levels to show on the treemap chart. These levels are interactive and are shown with their labels. Defaults to 2 if not specified.
    levels: i32,
    // The maximum possible data value. Cells with values greater than this will have the same color as cells with this value. If not specified, defaults to the actual maximum value from color_data, or the maximum value from size_data if color_data is not specified.
    maxValue: f64,
    // The minimum possible data value. Cells with values less than this will have the same color as cells with this value. If not specified, defaults to the actual minimum value from color_data, or the minimum value from size_data if color_data is not specified.
    minValue: f64,
    // The data the contains the treemap cells' parent labels.
    parentLabels: ChartDataSchema,
    // The data that determines the size of each treemap data cell. This data is expected to be numeric. The cells corresponding to non-numeric or missing data will not be rendered. If color_data is not specified, this data is used to determine data cell background colors as well.
    sizeData: ChartDataSchema,
    // The text format for all labels on the chart. The link field is not supported.
    textFormat: TextFormatSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Trims the whitespace (such as spaces, tabs, or new lines) in every cell in the specified range. This request removes all whitespace from the start and end of each cell's text, and reduces any subsequence of remaining whitespace characters to a single space. If the resulting trimmed text starts with a '+' or '=' character, the text remains as a string value and isn't interpreted as a formula.
pub const TrimWhitespaceRequestSchema = struct {
    const Self = @This();
    // The range whose cells to trim.
    range: GridRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The result of trimming whitespace in cells.
pub const TrimWhitespaceResponseSchema = struct {
    const Self = @This();
    // The number of cells that were trimmed of whitespace.
    cellsChangedCount: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Unmerges cells in the given range.
pub const UnmergeCellsRequestSchema = struct {
    const Self = @This();
    // The range within which all cells should be unmerged. If the range spans multiple merges, all will be unmerged. The range must not partially span any merge.
    range: GridRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Updates properties of the supplied banded range.
pub const UpdateBandingRequestSchema = struct {
    const Self = @This();
    // The banded range to update with the new properties.
    bandedRange: BandedRangeSchema,
    // The fields that should be updated. At least one field must be specified. The root `bandedRange` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field.
    fields: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Updates the borders of a range. If a field is not set in the request, that means the border remains as-is. For example, with two subsequent UpdateBordersRequest: 1. range: A1:A5 `{ top: RED, bottom: WHITE }` 2. range: A1:A5 `{ left: BLUE }` That would result in A1:A5 having a borders of `{ top: RED, bottom: WHITE, left: BLUE }`. If you want to clear a border, explicitly set the style to NONE.
pub const UpdateBordersRequestSchema = struct {
    const Self = @This();
    // The border to put at the bottom of the range.
    bottom: BorderSchema,
    // The horizontal border to put within the range.
    innerHorizontal: BorderSchema,
    // The vertical border to put within the range.
    innerVertical: BorderSchema,
    // The border to put at the left of the range.
    left: BorderSchema,
    // The range whose borders should be updated.
    range: GridRangeSchema,
    // The border to put at the right of the range.
    right: BorderSchema,
    // The border to put at the top of the range.
    top: BorderSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Updates all cells in a range with new data.
pub const UpdateCellsRequestSchema = struct {
    const Self = @This();
    // The fields of CellData that should be updated. At least one field must be specified. The root is the CellData; 'row.values.' should not be specified. A single `"*"` can be used as short-hand for listing every field.
    fields: []const u8,
    // The range to write data to. If the data in rows does not cover the entire requested range, the fields matching those set in fields will be cleared.
    range: GridRangeSchema,
    // The data to write.
    rows: []const RowDataSchema,
    // The coordinate to start writing data at. Any number of rows and columns (including a different number of columns per row) may be written.
    start: GridCoordinateSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Updates a chart's specifications. (This does not move or resize a chart. To move or resize a chart, use UpdateEmbeddedObjectPositionRequest.)
pub const UpdateChartSpecRequestSchema = struct {
    const Self = @This();
    // The ID of the chart to update.
    chartId: i32,
    // The specification to apply to the chart.
    spec: ChartSpecSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Updates a conditional format rule at the given index, or moves a conditional format rule to another index.
pub const UpdateConditionalFormatRuleRequestSchema = struct {
    const Self = @This();
    // The zero-based index of the rule that should be replaced or moved.
    index: i32,
    // The zero-based new index the rule should end up at.
    newIndex: i32,
    // The rule that should replace the rule at the given index.
    rule: ConditionalFormatRuleSchema,
    // The sheet of the rule to move. Required if new_index is set, unused otherwise.
    sheetId: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The result of updating a conditional format rule.
pub const UpdateConditionalFormatRuleResponseSchema = struct {
    const Self = @This();
    // The index of the new rule.
    newIndex: i32,
    // The new rule that replaced the old rule (if replacing), or the rule that was moved (if moved)
    newRule: ConditionalFormatRuleSchema,
    // The old index of the rule. Not set if a rule was replaced (because it is the same as new_index).
    oldIndex: i32,
    // The old (deleted) rule. Not set if a rule was moved (because it is the same as new_rule).
    oldRule: ConditionalFormatRuleSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Updates a data source. After the data source is updated successfully, an execution is triggered to refresh the associated DATA_SOURCE sheet to read data from the updated data source. The request requires an additional `bigquery.readonly` OAuth scope.
pub const UpdateDataSourceRequestSchema = struct {
    const Self = @This();
    // The data source to update.
    dataSource: DataSourceSchema,
    // The fields that should be updated. At least one field must be specified. The root `dataSource` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field.
    fields: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The response from updating data source.
pub const UpdateDataSourceResponseSchema = struct {
    const Self = @This();
    // The data execution status.
    dataExecutionStatus: DataExecutionStatusSchema,
    // The updated data source.
    dataSource: DataSourceSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A request to update properties of developer metadata. Updates the properties of the developer metadata selected by the filters to the values provided in the DeveloperMetadata resource. Callers must specify the properties they wish to update in the fields parameter, as well as specify at least one DataFilter matching the metadata they wish to update.
pub const UpdateDeveloperMetadataRequestSchema = struct {
    const Self = @This();
    // The filters matching the developer metadata entries to update.
    dataFilters: []const DataFilterSchema,
    // The value that all metadata matched by the data filters will be updated to.
    developerMetadata: DeveloperMetadataSchema,
    // The fields that should be updated. At least one field must be specified. The root `developerMetadata` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field.
    fields: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The response from updating developer metadata.
pub const UpdateDeveloperMetadataResponseSchema = struct {
    const Self = @This();
    // The updated developer metadata.
    developerMetadata: []const DeveloperMetadataSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Updates the state of the specified group.
pub const UpdateDimensionGroupRequestSchema = struct {
    const Self = @This();
    // The group whose state should be updated. The range and depth of the group should specify a valid group on the sheet, and all other fields updated.
    dimensionGroup: DimensionGroupSchema,
    // The fields that should be updated. At least one field must be specified. The root `dimensionGroup` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field.
    fields: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Updates properties of dimensions within the specified range.
pub const UpdateDimensionPropertiesRequestSchema = struct {
    const Self = @This();
    // The columns on a data source sheet to update.
    dataSourceSheetRange: DataSourceSheetDimensionRangeSchema,
    // The fields that should be updated. At least one field must be specified. The root `properties` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field.
    fields: []const u8,
    // Properties to update.
    properties: DimensionPropertiesSchema,
    // The rows or columns to update.
    range: DimensionRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Updates an embedded object's border property.
pub const UpdateEmbeddedObjectBorderRequestSchema = struct {
    const Self = @This();
    // The border that applies to the embedded object.
    border: EmbeddedObjectBorderSchema,
    // The fields that should be updated. At least one field must be specified. The root `border` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field.
    fields: []const u8,
    // The ID of the embedded object to update.
    objectId: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Update an embedded object's position (such as a moving or resizing a chart or image).
pub const UpdateEmbeddedObjectPositionRequestSchema = struct {
    const Self = @This();
    // The fields of OverlayPosition that should be updated when setting a new position. Used only if newPosition.overlayPosition is set, in which case at least one field must be specified. The root `newPosition.overlayPosition` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field.
    fields: []const u8,
    // An explicit position to move the embedded object to. If newPosition.sheetId is set, a new sheet with that ID will be created. If newPosition.newSheet is set to true, a new sheet will be created with an ID that will be chosen for you.
    newPosition: EmbeddedObjectPositionSchema,
    // The ID of the object to moved.
    objectId: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The result of updating an embedded object's position.
pub const UpdateEmbeddedObjectPositionResponseSchema = struct {
    const Self = @This();
    // The new position of the embedded object.
    position: EmbeddedObjectPositionSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Updates properties of the filter view.
pub const UpdateFilterViewRequestSchema = struct {
    const Self = @This();
    // The fields that should be updated. At least one field must be specified. The root `filter` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field.
    fields: []const u8,
    // The new properties of the filter view.
    filter: FilterViewSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Updates properties of the named range with the specified namedRangeId.
pub const UpdateNamedRangeRequestSchema = struct {
    const Self = @This();
    // The fields that should be updated. At least one field must be specified. The root `namedRange` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field.
    fields: []const u8,
    // The named range to update with the new properties.
    namedRange: NamedRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Updates an existing protected range with the specified protectedRangeId.
pub const UpdateProtectedRangeRequestSchema = struct {
    const Self = @This();
    // The fields that should be updated. At least one field must be specified. The root `protectedRange` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field.
    fields: []const u8,
    // The protected range to update with the new properties.
    protectedRange: ProtectedRangeSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Updates properties of the sheet with the specified sheetId.
pub const UpdateSheetPropertiesRequestSchema = struct {
    const Self = @This();
    // The fields that should be updated. At least one field must be specified. The root `properties` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field.
    fields: []const u8,
    // The properties to update.
    properties: SheetPropertiesSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Updates a slicer's specifications. (This does not move or resize a slicer. To move or resize a slicer use UpdateEmbeddedObjectPositionRequest.
pub const UpdateSlicerSpecRequestSchema = struct {
    const Self = @This();
    // The fields that should be updated. At least one field must be specified. The root `SlicerSpec` is implied and should not be specified. A single "*"` can be used as short-hand for listing every field.
    fields: []const u8,
    // The id of the slicer to update.
    slicerId: i32,
    // The specification to apply to the slicer.
    spec: SlicerSpecSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Updates properties of a spreadsheet.
pub const UpdateSpreadsheetPropertiesRequestSchema = struct {
    const Self = @This();
    // The fields that should be updated. At least one field must be specified. The root 'properties' is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field.
    fields: []const u8,
    // The properties to update.
    properties: SpreadsheetPropertiesSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The response when updating a range of values by a data filter in a spreadsheet.
pub const UpdateValuesByDataFilterResponseSchema = struct {
    const Self = @This();
    // The data filter that selected the range that was updated.
    dataFilter: DataFilterSchema,
    // The number of cells updated.
    updatedCells: i32,
    // The number of columns where at least one cell in the column was updated.
    updatedColumns: i32,
    // The values of the cells in the range matched by the dataFilter after all updates were applied. This is only included if the request's `includeValuesInResponse` field was `true`.
    updatedData: ValueRangeSchema,
    // The range (in [A1 notation](/sheets/api/guides/concepts#cell)) that updates were applied to.
    updatedRange: []const u8,
    // The number of rows where at least one cell in the row was updated.
    updatedRows: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The response when updating a range of values in a spreadsheet.
pub const UpdateValuesResponseSchema = struct {
    const Self = @This();
    // The spreadsheet the updates were applied to.
    spreadsheetId: []const u8,
    // The number of cells updated.
    updatedCells: i32,
    // The number of columns where at least one cell in the column was updated.
    updatedColumns: i32,
    // The values of the cells after updates were applied. This is only included if the request's `includeValuesInResponse` field was `true`.
    updatedData: ValueRangeSchema,
    // The range (in A1 notation) that updates were applied to.
    updatedRange: []const u8,
    // The number of rows where at least one cell in the row was updated.
    updatedRows: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Data within a range of the spreadsheet.
pub const ValueRangeSchema = struct {
    const Self = @This();
    // The major dimension of the values. For output, if the spreadsheet data is: `A1=1,B1=2,A2=3,B2=4`, then requesting `range=A1:B2,majorDimension=ROWS` will return `[[1,2],[3,4]]`, whereas requesting `range=A1:B2,majorDimension=COLUMNS` will return `[[1,3],[2,4]]`. For input, with `range=A1:B2,majorDimension=ROWS` then `[[1,2],[3,4]]` will set `A1=1,B1=2,A2=3,B2=4`. With `range=A1:B2,majorDimension=COLUMNS` then `[[1,2],[3,4]]` will set `A1=1,B1=3,A2=2,B2=4`. When writing, if this field is not set, it defaults to ROWS.
    majorDimension: []const u8,
    // The range the values cover, in [A1 notation](/sheets/api/guides/concepts#cell). For output, this range indicates the entire requested range, even though the values will exclude trailing rows and columns. When appending values, this field represents the range to search for a table, after which values will be appended.
    range: []const u8,
    // The data that was read or to be written. This is an array of arrays, the outer array representing all the data and each inner array representing a major dimension. Each item in the inner array corresponds with one cell. For output, empty trailing rows and columns will not be included. For input, supported value types are: bool, string, and double. Null values will be skipped. To set a cell to an empty value, set the string value to an empty string.
    values: []const []const []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// Styles for a waterfall chart column.
pub const WaterfallChartColumnStyleSchema = struct {
    const Self = @This();
    // The color of the column. Deprecated: Use color_style.
    color: ColorSchema,
    // The color of the column. If color is also set, this field takes precedence.
    colorStyle: ColorStyleSchema,
    // The label of the column's legend.
    label: []const u8,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A custom subtotal column for a waterfall chart series.
pub const WaterfallChartCustomSubtotalSchema = struct {
    const Self = @This();
    // True if the data point at subtotal_index is the subtotal. If false, the subtotal will be computed and appear after the data point.
    dataIsSubtotal: bool,
    // A label for the subtotal column.
    label: []const u8,
    // The 0-based index of a data point within the series. If data_is_subtotal is true, the data point at this index is the subtotal. Otherwise, the subtotal appears after the data point with this index. A series can have multiple subtotals at arbitrary indices, but subtotals do not affect the indices of the data points. For example, if a series has three data points, their indices will always be 0, 1, and 2, regardless of how many subtotals exist on the series or what data points they are associated with.
    subtotalIndex: i32,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// The domain of a waterfall chart.
pub const WaterfallChartDomainSchema = struct {
    const Self = @This();
    // The data of the WaterfallChartDomain.
    data: ChartDataSchema,
    // True to reverse the order of the domain values (horizontal axis).
    reversed: bool,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A single series of data for a waterfall chart.
pub const WaterfallChartSeriesSchema = struct {
    const Self = @This();
    // Custom subtotal columns appearing in this series. The order in which subtotals are defined is not significant. Only one subtotal may be defined for each data point.
    customSubtotals: []const WaterfallChartCustomSubtotalSchema,
    // The data being visualized in this series.
    data: ChartDataSchema,
    // Information about the data labels for this series.
    dataLabel: DataLabelSchema,
    // True to hide the subtotal column from the end of the series. By default, a subtotal column will appear at the end of each series. Setting this field to true will hide that subtotal column for this series.
    hideTrailingSubtotal: bool,
    // Styles for all columns in this series with negative values.
    negativeColumnsStyle: WaterfallChartColumnStyleSchema,
    // Styles for all columns in this series with positive values.
    positiveColumnsStyle: WaterfallChartColumnStyleSchema,
    // Styles for all subtotal columns in this series.
    subtotalColumnsStyle: WaterfallChartColumnStyleSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
// A waterfall chart.
pub const WaterfallChartSpecSchema = struct {
    const Self = @This();
    // The line style for the connector lines.
    connectorLineStyle: LineStyleSchema,
    // The domain data (horizontal axis) for the waterfall chart.
    domain: WaterfallChartDomainSchema,
    // True to interpret the first value as a total.
    firstValueIsTotal: bool,
    // True to hide connector lines between columns.
    hideConnectorLines: bool,
    // The data this waterfall chart is visualizing.
    series: []const WaterfallChartSeriesSchema,
    // The stacked type.
    stackedType: []const u8,
    // Controls whether to display additional data labels on stacked charts which sum the total value of all stacked values at each value along the domain axis. stacked_type must be STACKED and neither CUSTOM nor placement can be set on the total_data_label.
    totalDataLabel: DataLabelSchema,
    pub fn deinit(self: Self, service: *Service) void {
        std.json.parseFree(Self, self, .{ .allocator = service.allocator });
    }
};
pub const Service = struct {
    @"allocator": Allocator,
    @"client": *requestz.Client,
    @"auth": *oauth2.Authenticator,
    @"scopes": []const []const u8,
    @"base_url": []const u8 = "https://sheets.googleapis.com/",
    @"root_url": []const u8 = "https://sheets.googleapis.com/",
    @"user_agent": []const u8 = "zoogle-api-zig-client/0.1.0",
    // V1 error format.
    @"$.xgafv": ?[]const u8 = null,
    // OAuth access token.
    @"access_token": ?[]const u8 = null,
    // Data format for response.
    @"alt": ?[]const u8 = "json",
    // JSONP
    @"callback": ?[]const u8 = null,
    // Selector specifying which fields to include in a partial response.
    @"fields": ?[]const u8 = null,
    // API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    @"key": ?[]const u8 = null,
    // OAuth 2.0 token for the current user.
    @"oauth_token": ?[]const u8 = null,
    // Returns response with indentations and line breaks.
    @"prettyPrint": ?bool = true,
    // Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    @"quotaUser": ?[]const u8 = null,
    // Legacy upload protocol for media (e.g. "media", "multipart").
    @"uploadType": ?[]const u8 = null,
    // Upload protocol for media (e.g. "raw", "multipart").
    @"upload_protocol": ?[]const u8 = null,
    pub const Spreadsheets = struct {
        // The spreadsheet to apply the updates to.
        @"spreadsheetId": []const u8,
        // True if grid data should be returned. This parameter is ignored if a field mask was set in the request.
        @"includeGridData": ?bool = null,
        // The ranges to retrieve from the spreadsheet.
        @"ranges": ?[]const u8 = null,
        pub const DeveloperMetadata = struct {
            // The ID of the developer metadata to retrieve.
            @"metadataId": i32,
            // The ID of the spreadsheet to retrieve metadata from.
            @"spreadsheetId": []const u8,
            pub fn @"metadataIdSet"(self: *@This(), val: i32) void {
                self.@"metadataId" = val;
            }
            pub fn @"spreadsheetIdSet"(self: *@This(), val: []const u8) void {
                self.@"spreadsheetId" = val;
            }

            // Returns the developer metadata with the specified ID. The caller must specify the spreadsheet ID and the developer metadata's unique metadataId.
            pub fn get(
                self: *@This(),
                service: *Service,
            ) !DeveloperMetadataSchema {
                var headers = Headers.init(service.allocator);
                defer headers.deinit();
                var auth = std.ArrayList(u8).init(service.allocator);
                defer auth.deinit();
                const token = try service.auth.token(service.scopes);
                try auth.appendSlice("Bearer ");
                try auth.appendSlice(token.value);
                try headers.append("x-goog-api-client", service.user_agent);
                try headers.append("User-Agent", service.user_agent);
                try headers.append("Authorization", auth.items);
                inline for (std.meta.fields(Service)) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    if (opt) {
                        if (@field(service, field.name)) |f| {
                            switch (@typeInfo(@typeInfo(field.field_type).Optional.child)) {
                                .Bool => if (f)
                                    try headers.append(field.name, "true")
                                else
                                    try headers.append(field.name, "false"),
                                else => try headers.append(field.name, f),
                            }
                        }
                    }
                }
                inline for (std.meta.fields(@This())) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    if (!opt) try headers.append(field.name, @field(self, field.name));
                }
                var url = std.ArrayList(u8).init(service.allocator);
                defer url.deinit();
                try url.appendSlice(service.base_url);
                try std.fmt.format(url.writer(), "v4/spreadsheets/{s}/developerMetadata/{s}?", .{
                    self.spreadsheetId,
                    self.metadataId,
                });
                var first = true;
                inline for (std.meta.fields(@This())) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    const f = @field(self, field.name);
                    if (opt) {
                        if (f) |val| {
                            if (!first) try url.append('&');
                            try std.fmt.format(url.writer(), "{s}={s}", .{ field.name, val });
                            first = false;
                        }
                    }
                }
                var idx: usize = service.base_url.len;
                const invalid = &[_]u8{ ':', ' ', '\'' };
                const replacement = [_][]const u8{ "%3A", "%20", "%27" };
                while (std.mem.indexOfAnyPos(u8, url.items, idx, invalid)) |begin| {
                    const replacement_idx = std.mem.indexOfScalar(u8, invalid, url.items[begin]).?;
                    try url.replaceRange(begin, 1, replacement[replacement_idx]);
                    idx = begin + 3;
                }
                for (headers.items()) |header| log.info("Header:\n    Name: {s}, Value: {s}\n", .{ header.name.value, header.value });
                log.info("Url: {s}\n", .{url.items});
                var response = try service.client.get(url.items, .{ .headers = headers.items() });
                log.info("Response: {s}\n", .{response.body});
                defer response.deinit();
                var tokens = std.json.TokenStream.init(response.body);
                return std.json.parse(DeveloperMetadataSchema, &tokens, .{ .allocator = service.allocator });
            }
            // Returns all developer metadata matching the specified DataFilter. If the provided DataFilter represents a DeveloperMetadataLookup object, this will return all DeveloperMetadata entries selected by it. If the DataFilter represents a location in a spreadsheet, this will return all developer metadata associated with locations intersecting that region.
            pub fn search(
                self: *@This(),
                service: *Service,
                request: *SearchDeveloperMetadataRequestSchema,
            ) !SearchDeveloperMetadataResponseSchema {
                var headers = Headers.init(service.allocator);
                defer headers.deinit();
                var auth = std.ArrayList(u8).init(service.allocator);
                defer auth.deinit();
                const token = try service.auth.token(service.scopes);
                try auth.appendSlice("Bearer ");
                try auth.appendSlice(token.value);
                try headers.append("x-goog-api-client", service.user_agent);
                try headers.append("User-Agent", service.user_agent);
                try headers.append("Authorization", auth.items);
                inline for (std.meta.fields(Service)) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    if (opt) {
                        if (@field(service, field.name)) |f| {
                            switch (@typeInfo(@typeInfo(field.field_type).Optional.child)) {
                                .Bool => if (f)
                                    try headers.append(field.name, "true")
                                else
                                    try headers.append(field.name, "false"),
                                else => try headers.append(field.name, f),
                            }
                        }
                    }
                }
                inline for (std.meta.fields(@This())) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    if (!opt) try headers.append(field.name, @field(self, field.name));
                }
                var url = std.ArrayList(u8).init(service.allocator);
                defer url.deinit();
                try url.appendSlice(service.base_url);
                try std.fmt.format(url.writer(), "v4/spreadsheets/{s}/developerMetadata:search?", .{
                    self.spreadsheetId,
                });
                var first = true;
                inline for (std.meta.fields(@This())) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    const f = @field(self, field.name);
                    if (opt) {
                        if (f) |val| {
                            if (!first) try url.append('&');
                            try std.fmt.format(url.writer(), "{s}={s}", .{ field.name, val });
                            first = false;
                        }
                    }
                }
                var idx: usize = service.base_url.len;
                const invalid = &[_]u8{ ':', ' ', '\'' };
                const replacement = [_][]const u8{ "%3A", "%20", "%27" };
                while (std.mem.indexOfAnyPos(u8, url.items, idx, invalid)) |begin| {
                    const replacement_idx = std.mem.indexOfScalar(u8, invalid, url.items[begin]).?;
                    try url.replaceRange(begin, 1, replacement[replacement_idx]);
                    idx = begin + 3;
                }
                const body = try std.json.stringifyAlloc(service.allocator, request, .{});
                defer service.allocator.free(body);
                try headers.append("Content-Type", "application/json");
                try headers.append("Accept", "application/json");
                for (headers.items()) |header| log.info("Header:\n    Name: {s}, Value: {s}\n", .{ header.name.value, header.value });
                log.info("Body: {s}\n", .{body});
                log.info("Url: {s}\n", .{url.items});
                var response = try service.client.post(url.items, .{ .headers = headers.items(), .content = body });
                log.info("Response: {s}\n", .{response.body});
                defer response.deinit();
                var tokens = std.json.TokenStream.init(response.body);
                return std.json.parse(SearchDeveloperMetadataResponseSchema, &tokens, .{ .allocator = service.allocator });
            }
            pub fn init(
                metadataId: i32,
                spreadsheetId: []const u8,
            ) @This() {
                return @This(){
                    .metadataId = metadataId,
                    .spreadsheetId = spreadsheetId,
                };
            }
        };
        pub const Sheets = struct {
            // The ID of the sheet to copy.
            @"sheetId": i32,
            // The ID of the spreadsheet containing the sheet to copy.
            @"spreadsheetId": []const u8,
            pub fn @"sheetIdSet"(self: *@This(), val: i32) void {
                self.@"sheetId" = val;
            }
            pub fn @"spreadsheetIdSet"(self: *@This(), val: []const u8) void {
                self.@"spreadsheetId" = val;
            }

            // Copies a single sheet from a spreadsheet to another spreadsheet. Returns the properties of the newly created sheet.
            pub fn copyTo(
                self: *@This(),
                service: *Service,
                request: *CopySheetToAnotherSpreadsheetRequestSchema,
            ) !SheetPropertiesSchema {
                var headers = Headers.init(service.allocator);
                defer headers.deinit();
                var auth = std.ArrayList(u8).init(service.allocator);
                defer auth.deinit();
                const token = try service.auth.token(service.scopes);
                try auth.appendSlice("Bearer ");
                try auth.appendSlice(token.value);
                try headers.append("x-goog-api-client", service.user_agent);
                try headers.append("User-Agent", service.user_agent);
                try headers.append("Authorization", auth.items);
                inline for (std.meta.fields(Service)) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    if (opt) {
                        if (@field(service, field.name)) |f| {
                            switch (@typeInfo(@typeInfo(field.field_type).Optional.child)) {
                                .Bool => if (f)
                                    try headers.append(field.name, "true")
                                else
                                    try headers.append(field.name, "false"),
                                else => try headers.append(field.name, f),
                            }
                        }
                    }
                }
                inline for (std.meta.fields(@This())) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    if (!opt) try headers.append(field.name, @field(self, field.name));
                }
                var url = std.ArrayList(u8).init(service.allocator);
                defer url.deinit();
                try url.appendSlice(service.base_url);
                try std.fmt.format(url.writer(), "v4/spreadsheets/{s}/sheets/{s}:copyTo?", .{
                    self.spreadsheetId,
                    self.sheetId,
                });
                var first = true;
                inline for (std.meta.fields(@This())) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    const f = @field(self, field.name);
                    if (opt) {
                        if (f) |val| {
                            if (!first) try url.append('&');
                            try std.fmt.format(url.writer(), "{s}={s}", .{ field.name, val });
                            first = false;
                        }
                    }
                }
                var idx: usize = service.base_url.len;
                const invalid = &[_]u8{ ':', ' ', '\'' };
                const replacement = [_][]const u8{ "%3A", "%20", "%27" };
                while (std.mem.indexOfAnyPos(u8, url.items, idx, invalid)) |begin| {
                    const replacement_idx = std.mem.indexOfScalar(u8, invalid, url.items[begin]).?;
                    try url.replaceRange(begin, 1, replacement[replacement_idx]);
                    idx = begin + 3;
                }
                const body = try std.json.stringifyAlloc(service.allocator, request, .{});
                defer service.allocator.free(body);
                try headers.append("Content-Type", "application/json");
                try headers.append("Accept", "application/json");
                for (headers.items()) |header| log.info("Header:\n    Name: {s}, Value: {s}\n", .{ header.name.value, header.value });
                log.info("Body: {s}\n", .{body});
                log.info("Url: {s}\n", .{url.items});
                var response = try service.client.post(url.items, .{ .headers = headers.items(), .content = body });
                log.info("Response: {s}\n", .{response.body});
                defer response.deinit();
                var tokens = std.json.TokenStream.init(response.body);
                return std.json.parse(SheetPropertiesSchema, &tokens, .{ .allocator = service.allocator });
            }
            pub fn init(
                sheetId: i32,
                spreadsheetId: []const u8,
            ) @This() {
                return @This(){
                    .sheetId = sheetId,
                    .spreadsheetId = spreadsheetId,
                };
            }
        };
        pub const Values = struct {
            // Determines if the update response should include the values of the cells that were appended. By default, responses do not include the updated values.
            @"includeValuesInResponse": ?bool = null,
            // How the input data should be inserted.
            @"insertDataOption": ?[]const u8 = null,
            // The [A1 notation](/sheets/api/guides/concepts#cell) of a range to search for a logical table of data. Values are appended after the last row of the table.
            @"range": []const u8,
            // Determines how dates, times, and durations in the response should be rendered. This is ignored if response_value_render_option is FORMATTED_VALUE. The default dateTime render option is SERIAL_NUMBER.
            @"responseDateTimeRenderOption": ?[]const u8 = null,
            // Determines how values in the response should be rendered. The default render option is FORMATTED_VALUE.
            @"responseValueRenderOption": ?[]const u8 = null,
            // The ID of the spreadsheet to update.
            @"spreadsheetId": []const u8,
            // How the input data should be interpreted.
            @"valueInputOption": ?[]const u8 = null,
            // How dates, times, and durations should be represented in the output. This is ignored if value_render_option is FORMATTED_VALUE. The default dateTime render option is SERIAL_NUMBER.
            @"dateTimeRenderOption": ?[]const u8 = null,
            // The major dimension that results should use. For example, if the spreadsheet data is: `A1=1,B1=2,A2=3,B2=4`, then requesting `ranges=["A1:B2"],majorDimension=ROWS` returns `[[1,2],[3,4]]`, whereas requesting `ranges=["A1:B2"],majorDimension=COLUMNS` returns `[[1,3],[2,4]]`.
            @"majorDimension": ?[]const u8 = null,
            // The [A1 notation or R1C1 notation](/sheets/api/guides/concepts#cell) of the range to retrieve values from.
            @"ranges": ?[]const u8 = null,
            // How values should be represented in the output. The default render option is ValueRenderOption.FORMATTED_VALUE.
            @"valueRenderOption": ?[]const u8 = null,
            pub fn @"includeValuesInResponseSet"(self: *@This(), val: ?bool) void {
                self.@"includeValuesInResponse" = val;
            }
            pub fn @"insertDataOptionSet"(self: *@This(), val: ?[]const u8) void {
                self.@"insertDataOption" = val;
            }
            pub fn @"rangeSet"(self: *@This(), val: []const u8) void {
                self.@"range" = val;
            }
            pub fn @"responseDateTimeRenderOptionSet"(self: *@This(), val: ?[]const u8) void {
                self.@"responseDateTimeRenderOption" = val;
            }
            pub fn @"responseValueRenderOptionSet"(self: *@This(), val: ?[]const u8) void {
                self.@"responseValueRenderOption" = val;
            }
            pub fn @"spreadsheetIdSet"(self: *@This(), val: []const u8) void {
                self.@"spreadsheetId" = val;
            }
            pub fn @"valueInputOptionSet"(self: *@This(), val: ?[]const u8) void {
                self.@"valueInputOption" = val;
            }
            pub fn @"dateTimeRenderOptionSet"(self: *@This(), val: ?[]const u8) void {
                self.@"dateTimeRenderOption" = val;
            }
            pub fn @"majorDimensionSet"(self: *@This(), val: ?[]const u8) void {
                self.@"majorDimension" = val;
            }
            pub fn @"rangesSet"(self: *@This(), val: ?[]const u8) void {
                self.@"ranges" = val;
            }
            pub fn @"valueRenderOptionSet"(self: *@This(), val: ?[]const u8) void {
                self.@"valueRenderOption" = val;
            }

            // Appends values to a spreadsheet. The input range is used to search for existing data and find a "table" within that range. Values will be appended to the next row of the table, starting with the first column of the table. See the [guide](/sheets/api/guides/values#appending_values) and [sample code](/sheets/api/samples/writing#append_values) for specific details of how tables are detected and data is appended. The caller must specify the spreadsheet ID, range, and a valueInputOption. The `valueInputOption` only controls how the input data will be added to the sheet (column-wise or row-wise), it does not influence what cell the data starts being written to.
            pub fn append(
                self: *@This(),
                service: *Service,
                request: *ValueRangeSchema,
            ) !AppendValuesResponseSchema {
                var headers = Headers.init(service.allocator);
                defer headers.deinit();
                var auth = std.ArrayList(u8).init(service.allocator);
                defer auth.deinit();
                const token = try service.auth.token(service.scopes);
                try auth.appendSlice("Bearer ");
                try auth.appendSlice(token.value);
                try headers.append("x-goog-api-client", service.user_agent);
                try headers.append("User-Agent", service.user_agent);
                try headers.append("Authorization", auth.items);
                inline for (std.meta.fields(Service)) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    if (opt) {
                        if (@field(service, field.name)) |f| {
                            switch (@typeInfo(@typeInfo(field.field_type).Optional.child)) {
                                .Bool => if (f)
                                    try headers.append(field.name, "true")
                                else
                                    try headers.append(field.name, "false"),
                                else => try headers.append(field.name, f),
                            }
                        }
                    }
                }
                inline for (std.meta.fields(@This())) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    if (!opt) try headers.append(field.name, @field(self, field.name));
                }
                var url = std.ArrayList(u8).init(service.allocator);
                defer url.deinit();
                try url.appendSlice(service.base_url);
                try std.fmt.format(url.writer(), "v4/spreadsheets/{s}/values/{s}:append?", .{
                    self.spreadsheetId,
                    self.range,
                });
                var first = true;
                inline for (std.meta.fields(@This())) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    const f = @field(self, field.name);
                    if (opt) {
                        if (f) |val| {
                            if (!first) try url.append('&');
                            try std.fmt.format(url.writer(), "{s}={s}", .{ field.name, val });
                            first = false;
                        }
                    }
                }
                var idx: usize = service.base_url.len;
                const invalid = &[_]u8{ ':', ' ', '\'' };
                const replacement = [_][]const u8{ "%3A", "%20", "%27" };
                while (std.mem.indexOfAnyPos(u8, url.items, idx, invalid)) |begin| {
                    const replacement_idx = std.mem.indexOfScalar(u8, invalid, url.items[begin]).?;
                    try url.replaceRange(begin, 1, replacement[replacement_idx]);
                    idx = begin + 3;
                }
                const body = try std.json.stringifyAlloc(service.allocator, request, .{});
                defer service.allocator.free(body);
                try headers.append("Content-Type", "application/json");
                try headers.append("Accept", "application/json");
                for (headers.items()) |header| log.info("Header:\n    Name: {s}, Value: {s}\n", .{ header.name.value, header.value });
                log.info("Body: {s}\n", .{body});
                log.info("Url: {s}\n", .{url.items});
                var response = try service.client.post(url.items, .{ .headers = headers.items(), .content = body });
                log.info("Response: {s}\n", .{response.body});
                defer response.deinit();
                var tokens = std.json.TokenStream.init(response.body);
                return std.json.parse(AppendValuesResponseSchema, &tokens, .{ .allocator = service.allocator });
            }
            // Clears one or more ranges of values from a spreadsheet. The caller must specify the spreadsheet ID and one or more ranges. Only values are cleared -- all other properties of the cell (such as formatting and data validation) are kept.
            pub fn batchClear(
                self: *@This(),
                service: *Service,
                request: *BatchClearValuesRequestSchema,
            ) !BatchClearValuesResponseSchema {
                var headers = Headers.init(service.allocator);
                defer headers.deinit();
                var auth = std.ArrayList(u8).init(service.allocator);
                defer auth.deinit();
                const token = try service.auth.token(service.scopes);
                try auth.appendSlice("Bearer ");
                try auth.appendSlice(token.value);
                try headers.append("x-goog-api-client", service.user_agent);
                try headers.append("User-Agent", service.user_agent);
                try headers.append("Authorization", auth.items);
                inline for (std.meta.fields(Service)) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    if (opt) {
                        if (@field(service, field.name)) |f| {
                            switch (@typeInfo(@typeInfo(field.field_type).Optional.child)) {
                                .Bool => if (f)
                                    try headers.append(field.name, "true")
                                else
                                    try headers.append(field.name, "false"),
                                else => try headers.append(field.name, f),
                            }
                        }
                    }
                }
                inline for (std.meta.fields(@This())) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    if (!opt) try headers.append(field.name, @field(self, field.name));
                }
                var url = std.ArrayList(u8).init(service.allocator);
                defer url.deinit();
                try url.appendSlice(service.base_url);
                try std.fmt.format(url.writer(), "v4/spreadsheets/{s}/values:batchClear?", .{
                    self.spreadsheetId,
                });
                var first = true;
                inline for (std.meta.fields(@This())) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    const f = @field(self, field.name);
                    if (opt) {
                        if (f) |val| {
                            if (!first) try url.append('&');
                            try std.fmt.format(url.writer(), "{s}={s}", .{ field.name, val });
                            first = false;
                        }
                    }
                }
                var idx: usize = service.base_url.len;
                const invalid = &[_]u8{ ':', ' ', '\'' };
                const replacement = [_][]const u8{ "%3A", "%20", "%27" };
                while (std.mem.indexOfAnyPos(u8, url.items, idx, invalid)) |begin| {
                    const replacement_idx = std.mem.indexOfScalar(u8, invalid, url.items[begin]).?;
                    try url.replaceRange(begin, 1, replacement[replacement_idx]);
                    idx = begin + 3;
                }
                const body = try std.json.stringifyAlloc(service.allocator, request, .{});
                defer service.allocator.free(body);
                try headers.append("Content-Type", "application/json");
                try headers.append("Accept", "application/json");
                for (headers.items()) |header| log.info("Header:\n    Name: {s}, Value: {s}\n", .{ header.name.value, header.value });
                log.info("Body: {s}\n", .{body});
                log.info("Url: {s}\n", .{url.items});
                var response = try service.client.post(url.items, .{ .headers = headers.items(), .content = body });
                log.info("Response: {s}\n", .{response.body});
                defer response.deinit();
                var tokens = std.json.TokenStream.init(response.body);
                return std.json.parse(BatchClearValuesResponseSchema, &tokens, .{ .allocator = service.allocator });
            }
            // Clears one or more ranges of values from a spreadsheet. The caller must specify the spreadsheet ID and one or more DataFilters. Ranges matching any of the specified data filters will be cleared. Only values are cleared -- all other properties of the cell (such as formatting, data validation, etc..) are kept.
            pub fn batchClearByDataFilter(
                self: *@This(),
                service: *Service,
                request: *BatchClearValuesByDataFilterRequestSchema,
            ) !BatchClearValuesByDataFilterResponseSchema {
                var headers = Headers.init(service.allocator);
                defer headers.deinit();
                var auth = std.ArrayList(u8).init(service.allocator);
                defer auth.deinit();
                const token = try service.auth.token(service.scopes);
                try auth.appendSlice("Bearer ");
                try auth.appendSlice(token.value);
                try headers.append("x-goog-api-client", service.user_agent);
                try headers.append("User-Agent", service.user_agent);
                try headers.append("Authorization", auth.items);
                inline for (std.meta.fields(Service)) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    if (opt) {
                        if (@field(service, field.name)) |f| {
                            switch (@typeInfo(@typeInfo(field.field_type).Optional.child)) {
                                .Bool => if (f)
                                    try headers.append(field.name, "true")
                                else
                                    try headers.append(field.name, "false"),
                                else => try headers.append(field.name, f),
                            }
                        }
                    }
                }
                inline for (std.meta.fields(@This())) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    if (!opt) try headers.append(field.name, @field(self, field.name));
                }
                var url = std.ArrayList(u8).init(service.allocator);
                defer url.deinit();
                try url.appendSlice(service.base_url);
                try std.fmt.format(url.writer(), "v4/spreadsheets/{s}/values:batchClearByDataFilter?", .{
                    self.spreadsheetId,
                });
                var first = true;
                inline for (std.meta.fields(@This())) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    const f = @field(self, field.name);
                    if (opt) {
                        if (f) |val| {
                            if (!first) try url.append('&');
                            try std.fmt.format(url.writer(), "{s}={s}", .{ field.name, val });
                            first = false;
                        }
                    }
                }
                var idx: usize = service.base_url.len;
                const invalid = &[_]u8{ ':', ' ', '\'' };
                const replacement = [_][]const u8{ "%3A", "%20", "%27" };
                while (std.mem.indexOfAnyPos(u8, url.items, idx, invalid)) |begin| {
                    const replacement_idx = std.mem.indexOfScalar(u8, invalid, url.items[begin]).?;
                    try url.replaceRange(begin, 1, replacement[replacement_idx]);
                    idx = begin + 3;
                }
                const body = try std.json.stringifyAlloc(service.allocator, request, .{});
                defer service.allocator.free(body);
                try headers.append("Content-Type", "application/json");
                try headers.append("Accept", "application/json");
                for (headers.items()) |header| log.info("Header:\n    Name: {s}, Value: {s}\n", .{ header.name.value, header.value });
                log.info("Body: {s}\n", .{body});
                log.info("Url: {s}\n", .{url.items});
                var response = try service.client.post(url.items, .{ .headers = headers.items(), .content = body });
                log.info("Response: {s}\n", .{response.body});
                defer response.deinit();
                var tokens = std.json.TokenStream.init(response.body);
                return std.json.parse(BatchClearValuesByDataFilterResponseSchema, &tokens, .{ .allocator = service.allocator });
            }
            // Returns one or more ranges of values from a spreadsheet. The caller must specify the spreadsheet ID and one or more ranges.
            pub fn batchGet(
                self: *@This(),
                service: *Service,
            ) !BatchGetValuesResponseSchema {
                var headers = Headers.init(service.allocator);
                defer headers.deinit();
                var auth = std.ArrayList(u8).init(service.allocator);
                defer auth.deinit();
                const token = try service.auth.token(service.scopes);
                try auth.appendSlice("Bearer ");
                try auth.appendSlice(token.value);
                try headers.append("x-goog-api-client", service.user_agent);
                try headers.append("User-Agent", service.user_agent);
                try headers.append("Authorization", auth.items);
                inline for (std.meta.fields(Service)) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    if (opt) {
                        if (@field(service, field.name)) |f| {
                            switch (@typeInfo(@typeInfo(field.field_type).Optional.child)) {
                                .Bool => if (f)
                                    try headers.append(field.name, "true")
                                else
                                    try headers.append(field.name, "false"),
                                else => try headers.append(field.name, f),
                            }
                        }
                    }
                }
                inline for (std.meta.fields(@This())) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    if (!opt) try headers.append(field.name, @field(self, field.name));
                }
                var url = std.ArrayList(u8).init(service.allocator);
                defer url.deinit();
                try url.appendSlice(service.base_url);
                try std.fmt.format(url.writer(), "v4/spreadsheets/{s}/values:batchGet?", .{
                    self.spreadsheetId,
                });
                var first = true;
                inline for (std.meta.fields(@This())) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    const f = @field(self, field.name);
                    if (opt) {
                        if (f) |val| {
                            if (!first) try url.append('&');
                            try std.fmt.format(url.writer(), "{s}={s}", .{ field.name, val });
                            first = false;
                        }
                    }
                }
                var idx: usize = service.base_url.len;
                const invalid = &[_]u8{ ':', ' ', '\'' };
                const replacement = [_][]const u8{ "%3A", "%20", "%27" };
                while (std.mem.indexOfAnyPos(u8, url.items, idx, invalid)) |begin| {
                    const replacement_idx = std.mem.indexOfScalar(u8, invalid, url.items[begin]).?;
                    try url.replaceRange(begin, 1, replacement[replacement_idx]);
                    idx = begin + 3;
                }
                for (headers.items()) |header| log.info("Header:\n    Name: {s}, Value: {s}\n", .{ header.name.value, header.value });
                log.info("Url: {s}\n", .{url.items});
                var response = try service.client.get(url.items, .{ .headers = headers.items() });
                log.info("Response: {s}\n", .{response.body});
                defer response.deinit();
                var tokens = std.json.TokenStream.init(response.body);
                return std.json.parse(BatchGetValuesResponseSchema, &tokens, .{ .allocator = service.allocator });
            }
            // Returns one or more ranges of values that match the specified data filters. The caller must specify the spreadsheet ID and one or more DataFilters. Ranges that match any of the data filters in the request will be returned.
            pub fn batchGetByDataFilter(
                self: *@This(),
                service: *Service,
                request: *BatchGetValuesByDataFilterRequestSchema,
            ) !BatchGetValuesByDataFilterResponseSchema {
                var headers = Headers.init(service.allocator);
                defer headers.deinit();
                var auth = std.ArrayList(u8).init(service.allocator);
                defer auth.deinit();
                const token = try service.auth.token(service.scopes);
                try auth.appendSlice("Bearer ");
                try auth.appendSlice(token.value);
                try headers.append("x-goog-api-client", service.user_agent);
                try headers.append("User-Agent", service.user_agent);
                try headers.append("Authorization", auth.items);
                inline for (std.meta.fields(Service)) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    if (opt) {
                        if (@field(service, field.name)) |f| {
                            switch (@typeInfo(@typeInfo(field.field_type).Optional.child)) {
                                .Bool => if (f)
                                    try headers.append(field.name, "true")
                                else
                                    try headers.append(field.name, "false"),
                                else => try headers.append(field.name, f),
                            }
                        }
                    }
                }
                inline for (std.meta.fields(@This())) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    if (!opt) try headers.append(field.name, @field(self, field.name));
                }
                var url = std.ArrayList(u8).init(service.allocator);
                defer url.deinit();
                try url.appendSlice(service.base_url);
                try std.fmt.format(url.writer(), "v4/spreadsheets/{s}/values:batchGetByDataFilter?", .{
                    self.spreadsheetId,
                });
                var first = true;
                inline for (std.meta.fields(@This())) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    const f = @field(self, field.name);
                    if (opt) {
                        if (f) |val| {
                            if (!first) try url.append('&');
                            try std.fmt.format(url.writer(), "{s}={s}", .{ field.name, val });
                            first = false;
                        }
                    }
                }
                var idx: usize = service.base_url.len;
                const invalid = &[_]u8{ ':', ' ', '\'' };
                const replacement = [_][]const u8{ "%3A", "%20", "%27" };
                while (std.mem.indexOfAnyPos(u8, url.items, idx, invalid)) |begin| {
                    const replacement_idx = std.mem.indexOfScalar(u8, invalid, url.items[begin]).?;
                    try url.replaceRange(begin, 1, replacement[replacement_idx]);
                    idx = begin + 3;
                }
                const body = try std.json.stringifyAlloc(service.allocator, request, .{});
                defer service.allocator.free(body);
                try headers.append("Content-Type", "application/json");
                try headers.append("Accept", "application/json");
                for (headers.items()) |header| log.info("Header:\n    Name: {s}, Value: {s}\n", .{ header.name.value, header.value });
                log.info("Body: {s}\n", .{body});
                log.info("Url: {s}\n", .{url.items});
                var response = try service.client.post(url.items, .{ .headers = headers.items(), .content = body });
                log.info("Response: {s}\n", .{response.body});
                defer response.deinit();
                var tokens = std.json.TokenStream.init(response.body);
                return std.json.parse(BatchGetValuesByDataFilterResponseSchema, &tokens, .{ .allocator = service.allocator });
            }
            // Sets values in one or more ranges of a spreadsheet. The caller must specify the spreadsheet ID, a valueInputOption, and one or more ValueRanges.
            pub fn batchUpdate(
                self: *@This(),
                service: *Service,
                request: *BatchUpdateValuesRequestSchema,
            ) !BatchUpdateValuesResponseSchema {
                var headers = Headers.init(service.allocator);
                defer headers.deinit();
                var auth = std.ArrayList(u8).init(service.allocator);
                defer auth.deinit();
                const token = try service.auth.token(service.scopes);
                try auth.appendSlice("Bearer ");
                try auth.appendSlice(token.value);
                try headers.append("x-goog-api-client", service.user_agent);
                try headers.append("User-Agent", service.user_agent);
                try headers.append("Authorization", auth.items);
                inline for (std.meta.fields(Service)) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    if (opt) {
                        if (@field(service, field.name)) |f| {
                            switch (@typeInfo(@typeInfo(field.field_type).Optional.child)) {
                                .Bool => if (f)
                                    try headers.append(field.name, "true")
                                else
                                    try headers.append(field.name, "false"),
                                else => try headers.append(field.name, f),
                            }
                        }
                    }
                }
                inline for (std.meta.fields(@This())) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    if (!opt) try headers.append(field.name, @field(self, field.name));
                }
                var url = std.ArrayList(u8).init(service.allocator);
                defer url.deinit();
                try url.appendSlice(service.base_url);
                try std.fmt.format(url.writer(), "v4/spreadsheets/{s}/values:batchUpdate?", .{
                    self.spreadsheetId,
                });
                var first = true;
                inline for (std.meta.fields(@This())) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    const f = @field(self, field.name);
                    if (opt) {
                        if (f) |val| {
                            if (!first) try url.append('&');
                            try std.fmt.format(url.writer(), "{s}={s}", .{ field.name, val });
                            first = false;
                        }
                    }
                }
                var idx: usize = service.base_url.len;
                const invalid = &[_]u8{ ':', ' ', '\'' };
                const replacement = [_][]const u8{ "%3A", "%20", "%27" };
                while (std.mem.indexOfAnyPos(u8, url.items, idx, invalid)) |begin| {
                    const replacement_idx = std.mem.indexOfScalar(u8, invalid, url.items[begin]).?;
                    try url.replaceRange(begin, 1, replacement[replacement_idx]);
                    idx = begin + 3;
                }
                const body = try std.json.stringifyAlloc(service.allocator, request, .{});
                defer service.allocator.free(body);
                try headers.append("Content-Type", "application/json");
                try headers.append("Accept", "application/json");
                for (headers.items()) |header| log.info("Header:\n    Name: {s}, Value: {s}\n", .{ header.name.value, header.value });
                log.info("Body: {s}\n", .{body});
                log.info("Url: {s}\n", .{url.items});
                var response = try service.client.post(url.items, .{ .headers = headers.items(), .content = body });
                log.info("Response: {s}\n", .{response.body});
                defer response.deinit();
                var tokens = std.json.TokenStream.init(response.body);
                return std.json.parse(BatchUpdateValuesResponseSchema, &tokens, .{ .allocator = service.allocator });
            }
            // Sets values in one or more ranges of a spreadsheet. The caller must specify the spreadsheet ID, a valueInputOption, and one or more DataFilterValueRanges.
            pub fn batchUpdateByDataFilter(
                self: *@This(),
                service: *Service,
                request: *BatchUpdateValuesByDataFilterRequestSchema,
            ) !BatchUpdateValuesByDataFilterResponseSchema {
                var headers = Headers.init(service.allocator);
                defer headers.deinit();
                var auth = std.ArrayList(u8).init(service.allocator);
                defer auth.deinit();
                const token = try service.auth.token(service.scopes);
                try auth.appendSlice("Bearer ");
                try auth.appendSlice(token.value);
                try headers.append("x-goog-api-client", service.user_agent);
                try headers.append("User-Agent", service.user_agent);
                try headers.append("Authorization", auth.items);
                inline for (std.meta.fields(Service)) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    if (opt) {
                        if (@field(service, field.name)) |f| {
                            switch (@typeInfo(@typeInfo(field.field_type).Optional.child)) {
                                .Bool => if (f)
                                    try headers.append(field.name, "true")
                                else
                                    try headers.append(field.name, "false"),
                                else => try headers.append(field.name, f),
                            }
                        }
                    }
                }
                inline for (std.meta.fields(@This())) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    if (!opt) try headers.append(field.name, @field(self, field.name));
                }
                var url = std.ArrayList(u8).init(service.allocator);
                defer url.deinit();
                try url.appendSlice(service.base_url);
                try std.fmt.format(url.writer(), "v4/spreadsheets/{s}/values:batchUpdateByDataFilter?", .{
                    self.spreadsheetId,
                });
                var first = true;
                inline for (std.meta.fields(@This())) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    const f = @field(self, field.name);
                    if (opt) {
                        if (f) |val| {
                            if (!first) try url.append('&');
                            try std.fmt.format(url.writer(), "{s}={s}", .{ field.name, val });
                            first = false;
                        }
                    }
                }
                var idx: usize = service.base_url.len;
                const invalid = &[_]u8{ ':', ' ', '\'' };
                const replacement = [_][]const u8{ "%3A", "%20", "%27" };
                while (std.mem.indexOfAnyPos(u8, url.items, idx, invalid)) |begin| {
                    const replacement_idx = std.mem.indexOfScalar(u8, invalid, url.items[begin]).?;
                    try url.replaceRange(begin, 1, replacement[replacement_idx]);
                    idx = begin + 3;
                }
                const body = try std.json.stringifyAlloc(service.allocator, request, .{});
                defer service.allocator.free(body);
                try headers.append("Content-Type", "application/json");
                try headers.append("Accept", "application/json");
                for (headers.items()) |header| log.info("Header:\n    Name: {s}, Value: {s}\n", .{ header.name.value, header.value });
                log.info("Body: {s}\n", .{body});
                log.info("Url: {s}\n", .{url.items});
                var response = try service.client.post(url.items, .{ .headers = headers.items(), .content = body });
                log.info("Response: {s}\n", .{response.body});
                defer response.deinit();
                var tokens = std.json.TokenStream.init(response.body);
                return std.json.parse(BatchUpdateValuesByDataFilterResponseSchema, &tokens, .{ .allocator = service.allocator });
            }
            // Clears values from a spreadsheet. The caller must specify the spreadsheet ID and range. Only values are cleared -- all other properties of the cell (such as formatting, data validation, etc..) are kept.
            pub fn clear(
                self: *@This(),
                service: *Service,
                request: *ClearValuesRequestSchema,
            ) !ClearValuesResponseSchema {
                var headers = Headers.init(service.allocator);
                defer headers.deinit();
                var auth = std.ArrayList(u8).init(service.allocator);
                defer auth.deinit();
                const token = try service.auth.token(service.scopes);
                try auth.appendSlice("Bearer ");
                try auth.appendSlice(token.value);
                try headers.append("x-goog-api-client", service.user_agent);
                try headers.append("User-Agent", service.user_agent);
                try headers.append("Authorization", auth.items);
                inline for (std.meta.fields(Service)) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    if (opt) {
                        if (@field(service, field.name)) |f| {
                            switch (@typeInfo(@typeInfo(field.field_type).Optional.child)) {
                                .Bool => if (f)
                                    try headers.append(field.name, "true")
                                else
                                    try headers.append(field.name, "false"),
                                else => try headers.append(field.name, f),
                            }
                        }
                    }
                }
                inline for (std.meta.fields(@This())) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    if (!opt) try headers.append(field.name, @field(self, field.name));
                }
                var url = std.ArrayList(u8).init(service.allocator);
                defer url.deinit();
                try url.appendSlice(service.base_url);
                try std.fmt.format(url.writer(), "v4/spreadsheets/{s}/values/{s}:clear?", .{
                    self.spreadsheetId,
                    self.range,
                });
                var first = true;
                inline for (std.meta.fields(@This())) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    const f = @field(self, field.name);
                    if (opt) {
                        if (f) |val| {
                            if (!first) try url.append('&');
                            try std.fmt.format(url.writer(), "{s}={s}", .{ field.name, val });
                            first = false;
                        }
                    }
                }
                var idx: usize = service.base_url.len;
                const invalid = &[_]u8{ ':', ' ', '\'' };
                const replacement = [_][]const u8{ "%3A", "%20", "%27" };
                while (std.mem.indexOfAnyPos(u8, url.items, idx, invalid)) |begin| {
                    const replacement_idx = std.mem.indexOfScalar(u8, invalid, url.items[begin]).?;
                    try url.replaceRange(begin, 1, replacement[replacement_idx]);
                    idx = begin + 3;
                }
                const body = try std.json.stringifyAlloc(service.allocator, request, .{});
                defer service.allocator.free(body);
                try headers.append("Content-Type", "application/json");
                try headers.append("Accept", "application/json");
                for (headers.items()) |header| log.info("Header:\n    Name: {s}, Value: {s}\n", .{ header.name.value, header.value });
                log.info("Body: {s}\n", .{body});
                log.info("Url: {s}\n", .{url.items});
                var response = try service.client.post(url.items, .{ .headers = headers.items(), .content = body });
                log.info("Response: {s}\n", .{response.body});
                defer response.deinit();
                var tokens = std.json.TokenStream.init(response.body);
                return std.json.parse(ClearValuesResponseSchema, &tokens, .{ .allocator = service.allocator });
            }
            // Returns a range of values from a spreadsheet. The caller must specify the spreadsheet ID and a range.
            pub fn get(
                self: *@This(),
                service: *Service,
            ) !ValueRangeSchema {
                var headers = Headers.init(service.allocator);
                defer headers.deinit();
                var auth = std.ArrayList(u8).init(service.allocator);
                defer auth.deinit();
                const token = try service.auth.token(service.scopes);
                try auth.appendSlice("Bearer ");
                try auth.appendSlice(token.value);
                try headers.append("x-goog-api-client", service.user_agent);
                try headers.append("User-Agent", service.user_agent);
                try headers.append("Authorization", auth.items);
                inline for (std.meta.fields(Service)) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    if (opt) {
                        if (@field(service, field.name)) |f| {
                            switch (@typeInfo(@typeInfo(field.field_type).Optional.child)) {
                                .Bool => if (f)
                                    try headers.append(field.name, "true")
                                else
                                    try headers.append(field.name, "false"),
                                else => try headers.append(field.name, f),
                            }
                        }
                    }
                }
                inline for (std.meta.fields(@This())) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    if (!opt) try headers.append(field.name, @field(self, field.name));
                }
                var url = std.ArrayList(u8).init(service.allocator);
                defer url.deinit();
                try url.appendSlice(service.base_url);
                try std.fmt.format(url.writer(), "v4/spreadsheets/{s}/values/{s}?", .{
                    self.spreadsheetId,
                    self.range,
                });
                var first = true;
                inline for (std.meta.fields(@This())) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    const f = @field(self, field.name);
                    if (opt) {
                        if (f) |val| {
                            if (!first) try url.append('&');
                            try std.fmt.format(url.writer(), "{s}={s}", .{ field.name, val });
                            first = false;
                        }
                    }
                }
                var idx: usize = service.base_url.len;
                const invalid = &[_]u8{ ':', ' ', '\'' };
                const replacement = [_][]const u8{ "%3A", "%20", "%27" };
                while (std.mem.indexOfAnyPos(u8, url.items, idx, invalid)) |begin| {
                    const replacement_idx = std.mem.indexOfScalar(u8, invalid, url.items[begin]).?;
                    try url.replaceRange(begin, 1, replacement[replacement_idx]);
                    idx = begin + 3;
                }
                for (headers.items()) |header| log.info("Header:\n    Name: {s}, Value: {s}\n", .{ header.name.value, header.value });
                log.info("Url: {s}\n", .{url.items});
                var response = try service.client.get(url.items, .{ .headers = headers.items() });
                log.info("Response: {s}\n", .{response.body});
                defer response.deinit();
                var tokens = std.json.TokenStream.init(response.body);
                return std.json.parse(ValueRangeSchema, &tokens, .{ .allocator = service.allocator });
            }
            // Sets values in a range of a spreadsheet. The caller must specify the spreadsheet ID, range, and a valueInputOption.
            pub fn update(
                self: *@This(),
                service: *Service,
                request: *ValueRangeSchema,
            ) !UpdateValuesResponseSchema {
                var headers = Headers.init(service.allocator);
                defer headers.deinit();
                var auth = std.ArrayList(u8).init(service.allocator);
                defer auth.deinit();
                const token = try service.auth.token(service.scopes);
                try auth.appendSlice("Bearer ");
                try auth.appendSlice(token.value);
                try headers.append("x-goog-api-client", service.user_agent);
                try headers.append("User-Agent", service.user_agent);
                try headers.append("Authorization", auth.items);
                inline for (std.meta.fields(Service)) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    if (opt) {
                        if (@field(service, field.name)) |f| {
                            switch (@typeInfo(@typeInfo(field.field_type).Optional.child)) {
                                .Bool => if (f)
                                    try headers.append(field.name, "true")
                                else
                                    try headers.append(field.name, "false"),
                                else => try headers.append(field.name, f),
                            }
                        }
                    }
                }
                inline for (std.meta.fields(@This())) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    if (!opt) try headers.append(field.name, @field(self, field.name));
                }
                var url = std.ArrayList(u8).init(service.allocator);
                defer url.deinit();
                try url.appendSlice(service.base_url);
                try std.fmt.format(url.writer(), "v4/spreadsheets/{s}/values/{s}?", .{
                    self.spreadsheetId,
                    self.range,
                });
                var first = true;
                inline for (std.meta.fields(@This())) |field| {
                    const opt = @typeInfo(field.field_type) == .Optional;
                    const f = @field(self, field.name);
                    if (opt) {
                        if (f) |val| {
                            if (!first) try url.append('&');
                            try std.fmt.format(url.writer(), "{s}={s}", .{ field.name, val });
                            first = false;
                        }
                    }
                }
                var idx: usize = service.base_url.len;
                const invalid = &[_]u8{ ':', ' ', '\'' };
                const replacement = [_][]const u8{ "%3A", "%20", "%27" };
                while (std.mem.indexOfAnyPos(u8, url.items, idx, invalid)) |begin| {
                    const replacement_idx = std.mem.indexOfScalar(u8, invalid, url.items[begin]).?;
                    try url.replaceRange(begin, 1, replacement[replacement_idx]);
                    idx = begin + 3;
                }
                const body = try std.json.stringifyAlloc(service.allocator, request, .{});
                defer service.allocator.free(body);
                try headers.append("Content-Type", "application/json");
                try headers.append("Accept", "application/json");
                for (headers.items()) |header| log.info("Header:\n    Name: {s}, Value: {s}\n", .{ header.name.value, header.value });
                log.info("Body: {s}\n", .{body});
                log.info("Url: {s}\n", .{url.items});
                var response = try service.client.put(url.items, .{ .headers = headers.items(), .content = body });
                log.info("Response: {s}\n", .{response.body});
                defer response.deinit();
                var tokens = std.json.TokenStream.init(response.body);
                return std.json.parse(UpdateValuesResponseSchema, &tokens, .{ .allocator = service.allocator });
            }
            pub fn init(
                range: []const u8,
                spreadsheetId: []const u8,
            ) @This() {
                return @This(){
                    .range = range,
                    .spreadsheetId = spreadsheetId,
                };
            }
        };
        pub fn @"spreadsheetIdSet"(self: *@This(), val: []const u8) void {
            self.@"spreadsheetId" = val;
        }
        pub fn @"includeGridDataSet"(self: *@This(), val: ?bool) void {
            self.@"includeGridData" = val;
        }
        pub fn @"rangesSet"(self: *@This(), val: ?[]const u8) void {
            self.@"ranges" = val;
        }

        // Applies one or more updates to the spreadsheet. Each request is validated before being applied. If any request is not valid then the entire request will fail and nothing will be applied. Some requests have replies to give you some information about how they are applied. The replies will mirror the requests. For example, if you applied 4 updates and the 3rd one had a reply, then the response will have 2 empty replies, the actual reply, and another empty reply, in that order. Due to the collaborative nature of spreadsheets, it is not guaranteed that the spreadsheet will reflect exactly your changes after this completes, however it is guaranteed that the updates in the request will be applied together atomically. Your changes may be altered with respect to collaborator changes. If there are no collaborators, the spreadsheet should reflect your changes.
        pub fn batchUpdate(
            self: *@This(),
            service: *Service,
            request: *BatchUpdateSpreadsheetRequestSchema,
        ) !BatchUpdateSpreadsheetResponseSchema {
            var headers = Headers.init(service.allocator);
            defer headers.deinit();
            var auth = std.ArrayList(u8).init(service.allocator);
            defer auth.deinit();
            const token = try service.auth.token(service.scopes);
            try auth.appendSlice("Bearer ");
            try auth.appendSlice(token.value);
            try headers.append("x-goog-api-client", service.user_agent);
            try headers.append("User-Agent", service.user_agent);
            try headers.append("Authorization", auth.items);
            inline for (std.meta.fields(Service)) |field| {
                const opt = @typeInfo(field.field_type) == .Optional;
                if (opt) {
                    if (@field(service, field.name)) |f| {
                        switch (@typeInfo(@typeInfo(field.field_type).Optional.child)) {
                            .Bool => if (f)
                                try headers.append(field.name, "true")
                            else
                                try headers.append(field.name, "false"),
                            else => try headers.append(field.name, f),
                        }
                    }
                }
            }
            inline for (std.meta.fields(@This())) |field| {
                const opt = @typeInfo(field.field_type) == .Optional;
                if (!opt) try headers.append(field.name, @field(self, field.name));
            }
            var url = std.ArrayList(u8).init(service.allocator);
            defer url.deinit();
            try url.appendSlice(service.base_url);
            try std.fmt.format(url.writer(), "v4/spreadsheets/{s}:batchUpdate?", .{
                self.spreadsheetId,
            });
            var first = true;
            inline for (std.meta.fields(@This())) |field| {
                const opt = @typeInfo(field.field_type) == .Optional;
                const f = @field(self, field.name);
                if (opt) {
                    if (f) |val| {
                        if (!first) try url.append('&');
                        try std.fmt.format(url.writer(), "{s}={s}", .{ field.name, val });
                        first = false;
                    }
                }
            }
            var idx: usize = service.base_url.len;
            const invalid = &[_]u8{ ':', ' ', '\'' };
            const replacement = [_][]const u8{ "%3A", "%20", "%27" };
            while (std.mem.indexOfAnyPos(u8, url.items, idx, invalid)) |begin| {
                const replacement_idx = std.mem.indexOfScalar(u8, invalid, url.items[begin]).?;
                try url.replaceRange(begin, 1, replacement[replacement_idx]);
                idx = begin + 3;
            }
            const body = try std.json.stringifyAlloc(service.allocator, request, .{});
            defer service.allocator.free(body);
            try headers.append("Content-Type", "application/json");
            try headers.append("Accept", "application/json");
            for (headers.items()) |header| log.info("Header:\n    Name: {s}, Value: {s}\n", .{ header.name.value, header.value });
            log.info("Body: {s}\n", .{body});
            log.info("Url: {s}\n", .{url.items});
            var response = try service.client.post(url.items, .{ .headers = headers.items(), .content = body });
            log.info("Response: {s}\n", .{response.body});
            defer response.deinit();
            var tokens = std.json.TokenStream.init(response.body);
            return std.json.parse(BatchUpdateSpreadsheetResponseSchema, &tokens, .{ .allocator = service.allocator });
        }
        // Creates a spreadsheet, returning the newly created spreadsheet.
        pub fn create(
            self: *@This(),
            service: *Service,
            request: *SpreadsheetSchema,
        ) !SpreadsheetSchema {
            var headers = Headers.init(service.allocator);
            defer headers.deinit();
            var auth = std.ArrayList(u8).init(service.allocator);
            defer auth.deinit();
            const token = try service.auth.token(service.scopes);
            try auth.appendSlice("Bearer ");
            try auth.appendSlice(token.value);
            try headers.append("x-goog-api-client", service.user_agent);
            try headers.append("User-Agent", service.user_agent);
            try headers.append("Authorization", auth.items);
            inline for (std.meta.fields(Service)) |field| {
                const opt = @typeInfo(field.field_type) == .Optional;
                if (opt) {
                    if (@field(service, field.name)) |f| {
                        switch (@typeInfo(@typeInfo(field.field_type).Optional.child)) {
                            .Bool => if (f)
                                try headers.append(field.name, "true")
                            else
                                try headers.append(field.name, "false"),
                            else => try headers.append(field.name, f),
                        }
                    }
                }
            }
            inline for (std.meta.fields(@This())) |field| {
                const opt = @typeInfo(field.field_type) == .Optional;
                if (!opt) try headers.append(field.name, @field(self, field.name));
            }
            var url = std.ArrayList(u8).init(service.allocator);
            defer url.deinit();
            try url.appendSlice(service.base_url);
            try std.fmt.format(url.writer(), "v4/spreadsheets?", .{});
            var first = true;
            inline for (std.meta.fields(@This())) |field| {
                const opt = @typeInfo(field.field_type) == .Optional;
                const f = @field(self, field.name);
                if (opt) {
                    if (f) |val| {
                        if (!first) try url.append('&');
                        try std.fmt.format(url.writer(), "{s}={s}", .{ field.name, val });
                        first = false;
                    }
                }
            }
            var idx: usize = service.base_url.len;
            const invalid = &[_]u8{ ':', ' ', '\'' };
            const replacement = [_][]const u8{ "%3A", "%20", "%27" };
            while (std.mem.indexOfAnyPos(u8, url.items, idx, invalid)) |begin| {
                const replacement_idx = std.mem.indexOfScalar(u8, invalid, url.items[begin]).?;
                try url.replaceRange(begin, 1, replacement[replacement_idx]);
                idx = begin + 3;
            }
            const body = try std.json.stringifyAlloc(service.allocator, request, .{});
            defer service.allocator.free(body);
            try headers.append("Content-Type", "application/json");
            try headers.append("Accept", "application/json");
            for (headers.items()) |header| log.info("Header:\n    Name: {s}, Value: {s}\n", .{ header.name.value, header.value });
            log.info("Body: {s}\n", .{body});
            log.info("Url: {s}\n", .{url.items});
            var response = try service.client.post(url.items, .{ .headers = headers.items(), .content = body });
            log.info("Response: {s}\n", .{response.body});
            defer response.deinit();
            var tokens = std.json.TokenStream.init(response.body);
            return std.json.parse(SpreadsheetSchema, &tokens, .{ .allocator = service.allocator });
        }
        // Returns the spreadsheet at the given ID. The caller must specify the spreadsheet ID. By default, data within grids is not returned. You can include grid data in one of 2 ways: * Specify a field mask listing your desired fields using the `fields` URL parameter in HTTP * Set the includeGridData URL parameter to true. If a field mask is set, the `includeGridData` parameter is ignored For large spreadsheets, as a best practice, retrieve only the specific spreadsheet fields that you want. To retrieve only subsets of spreadsheet data, use the ranges URL parameter. Ranges are specified using [A1 notation](/sheets/api/guides/concepts#cell). You can define a single cell (for example, `A1`) or multiple cells (for example, `A1:D5`). You can also get cells from other sheets within the same spreadsheet (for example, `Sheet2!A1:C4`) or retrieve multiple ranges at once (for example, `?ranges=A1:D5&ranges=Sheet2!A1:C4`). Limiting the range returns only the portions of the spreadsheet that intersect the requested ranges.
        pub fn get(
            self: *@This(),
            service: *Service,
        ) !SpreadsheetSchema {
            var headers = Headers.init(service.allocator);
            defer headers.deinit();
            var auth = std.ArrayList(u8).init(service.allocator);
            defer auth.deinit();
            const token = try service.auth.token(service.scopes);
            try auth.appendSlice("Bearer ");
            try auth.appendSlice(token.value);
            try headers.append("x-goog-api-client", service.user_agent);
            try headers.append("User-Agent", service.user_agent);
            try headers.append("Authorization", auth.items);
            inline for (std.meta.fields(Service)) |field| {
                const opt = @typeInfo(field.field_type) == .Optional;
                if (opt) {
                    if (@field(service, field.name)) |f| {
                        switch (@typeInfo(@typeInfo(field.field_type).Optional.child)) {
                            .Bool => if (f)
                                try headers.append(field.name, "true")
                            else
                                try headers.append(field.name, "false"),
                            else => try headers.append(field.name, f),
                        }
                    }
                }
            }
            inline for (std.meta.fields(@This())) |field| {
                const opt = @typeInfo(field.field_type) == .Optional;
                if (!opt) try headers.append(field.name, @field(self, field.name));
            }
            var url = std.ArrayList(u8).init(service.allocator);
            defer url.deinit();
            try url.appendSlice(service.base_url);
            try std.fmt.format(url.writer(), "v4/spreadsheets/{s}?", .{
                self.spreadsheetId,
            });
            var first = true;
            inline for (std.meta.fields(@This())) |field| {
                const opt = @typeInfo(field.field_type) == .Optional;
                const f = @field(self, field.name);
                if (opt) {
                    if (f) |val| {
                        if (!first) try url.append('&');
                        try std.fmt.format(url.writer(), "{s}={s}", .{ field.name, val });
                        first = false;
                    }
                }
            }
            var idx: usize = service.base_url.len;
            const invalid = &[_]u8{ ':', ' ', '\'' };
            const replacement = [_][]const u8{ "%3A", "%20", "%27" };
            while (std.mem.indexOfAnyPos(u8, url.items, idx, invalid)) |begin| {
                const replacement_idx = std.mem.indexOfScalar(u8, invalid, url.items[begin]).?;
                try url.replaceRange(begin, 1, replacement[replacement_idx]);
                idx = begin + 3;
            }
            for (headers.items()) |header| log.info("Header:\n    Name: {s}, Value: {s}\n", .{ header.name.value, header.value });
            log.info("Url: {s}\n", .{url.items});
            var response = try service.client.get(url.items, .{ .headers = headers.items() });
            log.info("Response: {s}\n", .{response.body});
            defer response.deinit();
            var tokens = std.json.TokenStream.init(response.body);
            return std.json.parse(SpreadsheetSchema, &tokens, .{ .allocator = service.allocator });
        }
        // Returns the spreadsheet at the given ID. The caller must specify the spreadsheet ID. This method differs from GetSpreadsheet in that it allows selecting which subsets of spreadsheet data to return by specifying a dataFilters parameter. Multiple DataFilters can be specified. Specifying one or more data filters returns the portions of the spreadsheet that intersect ranges matched by any of the filters. By default, data within grids is not returned. You can include grid data one of 2 ways: * Specify a field mask listing your desired fields using the `fields` URL parameter in HTTP * Set the includeGridData parameter to true. If a field mask is set, the `includeGridData` parameter is ignored For large spreadsheets, as a best practice, retrieve only the specific spreadsheet fields that you want.
        pub fn getByDataFilter(
            self: *@This(),
            service: *Service,
            request: *GetSpreadsheetByDataFilterRequestSchema,
        ) !SpreadsheetSchema {
            var headers = Headers.init(service.allocator);
            defer headers.deinit();
            var auth = std.ArrayList(u8).init(service.allocator);
            defer auth.deinit();
            const token = try service.auth.token(service.scopes);
            try auth.appendSlice("Bearer ");
            try auth.appendSlice(token.value);
            try headers.append("x-goog-api-client", service.user_agent);
            try headers.append("User-Agent", service.user_agent);
            try headers.append("Authorization", auth.items);
            inline for (std.meta.fields(Service)) |field| {
                const opt = @typeInfo(field.field_type) == .Optional;
                if (opt) {
                    if (@field(service, field.name)) |f| {
                        switch (@typeInfo(@typeInfo(field.field_type).Optional.child)) {
                            .Bool => if (f)
                                try headers.append(field.name, "true")
                            else
                                try headers.append(field.name, "false"),
                            else => try headers.append(field.name, f),
                        }
                    }
                }
            }
            inline for (std.meta.fields(@This())) |field| {
                const opt = @typeInfo(field.field_type) == .Optional;
                if (!opt) try headers.append(field.name, @field(self, field.name));
            }
            var url = std.ArrayList(u8).init(service.allocator);
            defer url.deinit();
            try url.appendSlice(service.base_url);
            try std.fmt.format(url.writer(), "v4/spreadsheets/{s}:getByDataFilter?", .{
                self.spreadsheetId,
            });
            var first = true;
            inline for (std.meta.fields(@This())) |field| {
                const opt = @typeInfo(field.field_type) == .Optional;
                const f = @field(self, field.name);
                if (opt) {
                    if (f) |val| {
                        if (!first) try url.append('&');
                        try std.fmt.format(url.writer(), "{s}={s}", .{ field.name, val });
                        first = false;
                    }
                }
            }
            var idx: usize = service.base_url.len;
            const invalid = &[_]u8{ ':', ' ', '\'' };
            const replacement = [_][]const u8{ "%3A", "%20", "%27" };
            while (std.mem.indexOfAnyPos(u8, url.items, idx, invalid)) |begin| {
                const replacement_idx = std.mem.indexOfScalar(u8, invalid, url.items[begin]).?;
                try url.replaceRange(begin, 1, replacement[replacement_idx]);
                idx = begin + 3;
            }
            const body = try std.json.stringifyAlloc(service.allocator, request, .{});
            defer service.allocator.free(body);
            try headers.append("Content-Type", "application/json");
            try headers.append("Accept", "application/json");
            for (headers.items()) |header| log.info("Header:\n    Name: {s}, Value: {s}\n", .{ header.name.value, header.value });
            log.info("Body: {s}\n", .{body});
            log.info("Url: {s}\n", .{url.items});
            var response = try service.client.post(url.items, .{ .headers = headers.items(), .content = body });
            log.info("Response: {s}\n", .{response.body});
            defer response.deinit();
            var tokens = std.json.TokenStream.init(response.body);
            return std.json.parse(SpreadsheetSchema, &tokens, .{ .allocator = service.allocator });
        }
        pub fn init(
            spreadsheetId: []const u8,
        ) @This() {
            return @This(){
                .spreadsheetId = spreadsheetId,
            };
        }
    };
    pub fn @"allocatorSet"(self: *@This(), val: Allocator) void {
        self.@"allocator" = val;
    }
    pub fn @"clientSet"(self: *@This(), val: *requestz.Client) void {
        self.@"client" = val;
    }
    pub fn @"authSet"(self: *@This(), val: *oauth2.Authenticator) void {
        self.@"auth" = val;
    }
    pub fn @"scopesSet"(self: *@This(), val: []const []const u8) void {
        self.@"scopes" = val;
    }
    pub fn @"base_urlSet"(self: *@This(), val: []const u8) void {
        self.@"base_url" = val;
    }
    pub fn @"root_urlSet"(self: *@This(), val: []const u8) void {
        self.@"root_url" = val;
    }
    pub fn @"user_agentSet"(self: *@This(), val: []const u8) void {
        self.@"user_agent" = val;
    }
    pub fn @"$.xgafvSet"(self: *@This(), val: ?[]const u8) void {
        self.@"$.xgafv" = val;
    }
    pub fn @"access_tokenSet"(self: *@This(), val: ?[]const u8) void {
        self.@"access_token" = val;
    }
    pub fn @"altSet"(self: *@This(), val: ?[]const u8) void {
        self.@"alt" = val;
    }
    pub fn @"callbackSet"(self: *@This(), val: ?[]const u8) void {
        self.@"callback" = val;
    }
    pub fn @"fieldsSet"(self: *@This(), val: ?[]const u8) void {
        self.@"fields" = val;
    }
    pub fn @"keySet"(self: *@This(), val: ?[]const u8) void {
        self.@"key" = val;
    }
    pub fn @"oauth_tokenSet"(self: *@This(), val: ?[]const u8) void {
        self.@"oauth_token" = val;
    }
    pub fn @"prettyPrintSet"(self: *@This(), val: ?bool) void {
        self.@"prettyPrint" = val;
    }
    pub fn @"quotaUserSet"(self: *@This(), val: ?[]const u8) void {
        self.@"quotaUser" = val;
    }
    pub fn @"uploadTypeSet"(self: *@This(), val: ?[]const u8) void {
        self.@"uploadType" = val;
    }
    pub fn @"upload_protocolSet"(self: *@This(), val: ?[]const u8) void {
        self.@"upload_protocol" = val;
    }

    pub fn init(
        allocator: Allocator,
        client: *requestz.Client,
        auth: *oauth2.Authenticator,
        scopes: []const []const u8,
    ) @This() {
        return @This(){
            .allocator = allocator,
            .client = client,
            .auth = auth,
            .scopes = scopes,
        };
    }
};
test "static analysis" {
    std.testing.refAllDecls(@This());
}
