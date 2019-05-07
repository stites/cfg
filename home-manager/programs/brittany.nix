{
  xdg.configFile."brittany/config.yaml".text = ''
    conf_debug:
      dconf_roundtrip_exactprint_only: false
      dconf_dump_bridoc_simpl_par: false
      dconf_dump_ast_unknown: false
      dconf_dump_bridoc_simpl_floating: false
      dconf_dump_config: false
      dconf_dump_bridoc_raw: false
      dconf_dump_bridoc_final: false
      dconf_dump_bridoc_simpl_alt: false
      dconf_dump_bridoc_simpl_indent: false
      dconf_dump_annotations: false
      dconf_dump_bridoc_simpl_columns: false
      dconf_dump_ast_full: false
    conf_forward:
      options_ghc:
      - -XLambdaCase
      - -XMultiWayIf
      - -XGADTs
      - -XPatternGuards
      - -XViewPatterns
      - -XRecursiveDo
      - -XTupleSections
      - -XExplicitForAll
      - -XImplicitParams
      - -XQuasiQuotes
      - -XTemplateHaskell
      - -XBangPatterns
    conf_errorHandling:
      econf_ExactPrintFallback: ExactPrintFallbackModeInline
      econf_Werror: false
      econf_omit_output_valid_check: false
      econf_produceOutputOnErrors: false
    conf_preprocessor:
      ppconf_CPPMode: CPPModeAbort
      ppconf_hackAroundIncludes: false
    conf_obfuscate: false
    conf_roundtrip_exactprint_only: false
    conf_version: 1
    conf_layout:
      lconfig_reformatModulePreamble: true
      lconfig_altChooser:
        tag: AltChooserBoundedSearch
        contents: 3
      lconfig_allowSingleLineExportList: false
      lconfig_importColumn: 50
      lconfig_hangingTypeSignature: false
      lconfig_importAsColumn: 50
      lconfig_alignmentLimit: 30
      lconfig_indentListSpecial: true
      lconfig_indentAmount: 2
      lconfig_alignmentBreakOnMultiline: true
      lconfig_cols: 80
      lconfig_indentPolicy: IndentPolicyLeft
      lconfig_indentWhereSpecial: true
      lconfig_columnAlignMode:
        tag: ColumnAlignModeMajority
        contents: 0.7
  '';
}
