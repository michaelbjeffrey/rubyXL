module RubyXL
  ST_PageOrder           = %w{ downThenOver overThenDown }
  ST_Orientation         = %w{ default portrait landscape }
  ST_CellComments        = %w{ none asDisplayed atEnd }
  ST_PrintError          = %w{ displayed blank dash NA }
  ST_CfvoType            = %w{ num percent max min formula percentile }
  ST_SheetViewType       = %w{ normal pageBreakPreview pageLayout }
  ST_PivotAreaType       = %w{ none normal data all origin button topRight }
  ST_Axis                = %w{ axisRow axisCol axisPage axisValues }
  ST_BorderStyle         = %w{ none thin medium dashed dotted thick double hair
                               mediumDashed dashDot mediumDashDot dashDotDot slantDashDot }
  ST_HorizontalAlignment = %w{ general left center right fill justify centerContinuous distributed }
  ST_VerticalAlignment   = %w{ top center bottom justify distributed }
  ST_VectorBaseType      = %w{ variant i1 i2 i4 i8 ui1 ui2 ui4 ui8 r4 r8
                               lpstr lpwstr bstr date filetime bool cy error clsid cf }
  ST_PhoneticType        = %w{ halfwidthKatakana fullwidthKatakana Hiragana noConversion }
  ST_PhoneticAlignment   = %w{ noControl left center distributed }
  ST_WebSourceType       = %w{ sheet printArea autoFilter range chart pivotTable query label }
  ST_CellType            = %w{ b n e s str inlineStr }
  ST_GradientType        = %w{ linear path }
  ST_PatternType         = %w{ none solid mediumGray darkGray lightGray
                               darkHorizontal darkVertical darkDown darkUp darkGrid darkTrellis
                               lightHorizontal lightVertical lightDown lightUp lightGrid lightTrellis
                               gray125 gray0625 }
  ST_Objects             = %w{ all placeholders none }
  ST_UpdateLinks         = %w{ userSet never always }
  ST_Visibility          = %w{ visible hidden veryHidden }

  ST_DateTimeGrouping    = %w{ year month day hour minute second }
  ST_CalendarType        = %w{ none gregorian gregorianUs japan taiwan korea hijri thai hebrew
                               gregorianMeFrench gregorianArabic gregorianXlitEnglish gregorianXlitFrench }
  ST_FilterOperator      = %w{ equal lessThan lessThanOrEqual notEqual greaterThanOrEqual greaterThan }
  ST_DynamicFilterType   = %w{ null aboveAverage belowAverage tomorrow today yesterday
                               nextWeek thisWeek lastWeek nextMonth thisMonth lastMonth
                               nextQuarter thisQuarter lastQuarter nextYear thisYear lastYear
                               yearToDate Q1 Q2 Q3 Q4 M1 M2 M3 M4 M5 M6 M7 M8 M9 M10 M11 M12 }
  ST_IconSetType         = %w{ 3Arrows 3ArrowsGray 3Flags 3TrafficLights1 3TrafficLights2
                               3Signs 3Symbols 3Symbols2 4Arrows 4ArrowsGray 4RedToBlack
                               4Rating 4TrafficLights 5Arrows 5ArrowsGray 5Rating 5Quarters }
  ST_SortMethod          = %w{ stroke pinYin none }
  ST_SortBy              = %w{ value cellColor fontColor icon }

  ST_CellFormulaType     = %w{ normal array dataTable shared }
  ST_TargetScreenSize    = %w{ 544x376 640x480 720x512 800x600 1024x768 1152x882
                               1152x900 1280x1024 1600x1200 1800x1440 1920x1200 }
  ST_SmartTagShow        = %w{ all none noIndicator }

  ST_CfType              = %w{ expression cellIs colorScale dataBar iconSet top10 uniqueValues
                               duplicateValues containsText notContainsText beginsWith
                               endsWith containsBlanks notContainsBlanks containsErrors
                               notContainsErrors timePeriod aboveAverage }
  ST_TimePeriod          = %w{ today yesterday tomorrow last7Days thisMonth
                                lastMonth nextMonth thisWeek lastWeek nextWeek }
  ST_CalcMode            = %w{ manual auto autoNoTable }
  ST_RefMode             = %w{ A1 R1C1 }

  ST_DvAspect            = %w{ DVASPECT_CONTENT DVASPECT_ICON }
  ST_OleUpdate           = %w{ OLEUPDATE_ALWAYS OLEUPDATE_ONCALL }

  ST_Pane                = %w{ bottomRight topRight bottomLeft topLeft }
  ST_PaneState           = %w{ split frozen frozenSplit }

  ST_Comments            = %w{ commNone commIndicator commIndAndComment }

  ST_DataValidationType       = %w{ none whole decimal list date time textLength custom }
  ST_DataValidationErrorStyle = %w{ stop warning information }
  ST_DataValidationImeMode    = %w{ noControl off on disabled hiragana fullKatakana halfKatakana
                                    fullAlpha halfAlpha fullHangul halfHangul }
  ST_DataValidationOperator   = %w{ between notBetween equal notEqual lessThan lessThanOrEqual
                                    greaterThan greaterThanOrEqual }

  ST_DataConsolidateFunction  = %w{ average count countNums max min
                                    product stdDev stdDevp sum var varp }

  ST_ConditionalFormattingOperator = %w{ lessThan lessThanOrEqual equal notEqual greaterThanOrEqual greaterThan
                                         between notBetween containsText notContains beginsWith endsWith }

end
