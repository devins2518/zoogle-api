// Auto-generated file. DO NOT EDIT.

// See, edit, create, and delete all of your Google Drive files
pub const DriveScope = Scope{
    .id = "https://www.googleapis.com/auth/drive",
};

// See, edit, create, and delete only the specific Google Drive files you use with this app
pub const DriveFileScope = Scope{
    .id = "https://www.googleapis.com/auth/drive.file",
};

// See and download all your Google Drive files
pub const DriveReadonlyScope = Scope{
    .id = "https://www.googleapis.com/auth/drive.readonly",
};

// See, edit, create, and delete all your Google Sheets spreadsheets
pub const SpreadsheetsScope = Scope{
    .id = "https://www.googleapis.com/auth/spreadsheets",
};

// See all your Google Sheets spreadsheets
pub const SpreadsheetsReadonlyScope = Scope{
    .id = "https://www.googleapis.com/auth/spreadsheets.readonly",
};

pub const Spreadsheets = struct {
    fn batchUpdate() requestz.Response {
        
    }
    fn create() requestz.Response {
        
    }
    fn get() requestz.Response {
        
    }
    fn getByDataFilter() requestz.Response {
        
    }
};
