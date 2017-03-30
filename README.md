# TradeSkillMaster Operations filters for AdiBags

This is an addon for World of Warcraft that provides extra filters for AdiBags
for each of TradeSkillMaster's main modules' operations. The filters are to The
module level, not the operation level. So if you have a mail operation called
'MailToAlt', the items with that operation will be put in a filter group called
'TSM:Mailing', not 'TSM:MailToAlt'.

The initial goal of this addon is to provide bag grouping for items that will
be operated on by TradeSkillMaster. My requirement is that I can see items in
my bank that I should get out to auction, mail, or whatever.

## Dependencies

This addon depends on AdiBags and TradeSkillMaster.

## Special cases

### Mailing

I would like for the Mailing filters to exclude items that will be sent to the
current character to be excluded. This way the filter only contains items that
will be operated on. Unfortunately it seems particularly difficult to get this
information from TSM so it may be necessary to have a list of operations to exclude
for each TSM module.
