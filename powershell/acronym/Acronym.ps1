Function Get-Acronym() {
    <#
    .SYNOPSIS
    Get the acronym of a phrase.

    .DESCRIPTION
    Given a phrase, return the string acronym of that phrase.
    "As Soon As Possible" => "ASAP"

    .PARAMETER Phrase
    The phrase to get the acronym from.

    .EXAMPLE
    Get-Acronym -Phrase "As Soon As Possible"
    #>
    [CmdletBinding()]
    Param (
        [string]$Phrase
    )
    ($Phrase -split "[\s-]+" | ForEach-Object {
        # for whatever reason, -replace works with a regex, but .Replace doesn't
        $word = $_ -replace "[^a-zA-Z]", ""
        $word.Substring(0, 1).ToUpper()
    }) -join ""
}

