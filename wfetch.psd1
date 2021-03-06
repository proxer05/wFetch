@{

# Script module or binary module file associated with this manifest.
RootModule = '.\wfetch.psm1'

# Version number of this module.
ModuleVersion = '1.0'

# ID used to uniquely identify this module
GUID = '39ca3b7a-10f0-47b0-8950-0e2e45d4e939'

# Author of this module
Author = 'proxer05'

# Copyright statement for this module
Copyright = '(c) 2020 proxer05. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Minimalistic fetch tool based on Windows screenFetch by Julian Chow'

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
NestedModules = @('Art.psm1', 'Data.psm1')

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @('*')

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# List of all files packaged with this module
FileList = @('wfetch.psm1', 'Art.psm1', 'Data.psm1')


}

