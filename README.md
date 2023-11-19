# Stacked Sheet View Framework

This Project follows 'CLEAN ARCHITECTURE'. Implements 'StackedSheetView' in the **'lib -> presentation -> shared'** layer.

The 'StackedSheetView' is a widget to create a stacked sheet interface, where multiple sheets can be opened and closed in a sequential manner. It utilizes various components to achieve its functionality. Below is a description of the key components used in the StackedSheetView:

## StackedSheetController:

- A controller class that extends ValueNotifier<int> to manage the state of the stacked sheets.
- Keeps track of the currently opened sheet index and maintains a list of indices for sheets that are currently open.
- Provides methods to open the next sheet, close the current sheet, close all sheets, and check whether a specific sheet is open.

## StackedSheetOptions:

- A configuration class that defines customizable options for the appearance and behavior of the stacked sheets.
- Includes parameters such as animation duration, animation curve, sheet shape, sheet color, and specific durations and curves for opening and closing sheets.

## StackedSheetItem:

- A class representing an individual item in the stacked sheet.
- Defines builders for the call-to-action widget at the bottom of the expanded sheet, the collapsed widget displayed when the sheet is closed, and the body of the expanded sheet.
- Specifies the height of the collapsed widget when the sheet is closed
