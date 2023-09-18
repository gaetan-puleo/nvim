{
  enable = true;
    enableDiagnostics = true;
    enableGitStatus = true;
  defaultComponentConfigs = {
    indent = {
      withMarkers = false;
       indentMarker = "│";
        lastIndentMarker = "└";
        indentSize = 2;
    };
  };
  window = {
    mappingOptions = {
      noremap = true;
		  nowait = true;
        };
        mappings = {
        	"<cr>" = "open_with_window_picker";
        	"l" = "open_with_window_picker";
        	"h" = "close_node";
        	"<2-LeftMouse>" = "open_with_window_picker";
        };
  };
}