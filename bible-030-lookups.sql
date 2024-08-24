/***************************************************************************
* Bible Database: SQL Server
* https://github.com/donjewett/bible-sql
* 
* bible-030-lookups.sql
*
* Version: 2024.8.24
* 
* Script License: CC BY 4.0 - https://creativecommons.org/licenses/by/4.0/
*
***************************************************************************/

----------------------------------------------------------------------------
-- Languages
----------------------------------------------------------------------------
EXEC add_Language @id='hbo', @name='Ancient Hebrew', @html='he', @ancient=1
EXEC add_Language @id='grc', @name='Ancient Greek', @html='el', @ancient=1
EXEC add_Language @id='arc', @name='Ancient Aramaic', @html='he', @ancient=1
EXEC add_Language @id='eng', @name='English', @html='en', @ancient=0
EXEC add_Language @id='esp', @name='Spanish', @html='es', @ancient=0


----------------------------------------------------------------------------
-- Canons
----------------------------------------------------------------------------
EXEC add_Canon @id=100000000, @code='OT', @name='Old Testament', @lang='hbo'
EXEC add_Canon @id=300000000, @code='NT', @name='New Testament', @lang='grc'


----------------------------------------------------------------------------
-- GreekTextForms
----------------------------------------------------------------------------
EXEC add_GreekForm @id='AX', @name='Alexandrian'
EXEC add_GreekForm @id='BYZ', @name='Byzantine'
EXEC add_GreekForm @id='TRG', @name='Textus Receptus', @parent='BYZ'
EXEC add_GreekForm @id='F35', @name='Family 35', @parent='BYZ'


----------------------------------------------------------------------------
-- HebrewTextForms
----------------------------------------------------------------------------
EXEC add_HebrewForm @id='MAS', @name='Masoretic'
EXEC add_HebrewForm @id='LXX', @name='Septuagint'
EXEC add_HebrewForm @id='TRH', @name='Textus Receptus', @parent='MAS'


----------------------------------------------------------------------------
-- LicensePermissions
----------------------------------------------------------------------------
EXEC add_LicensePermission @id=1, @name='Unrestricted', @permissive=100
EXEC add_LicensePermission @id=2, @name='Attribution', @permissive=90
EXEC add_LicensePermission @id=3, @name='Attribution-ShareAlike', @permissive=80
EXEC add_LicensePermission @id=4, @name='Attribution-NoDerivs', @permissive=70
EXEC add_LicensePermission @id=5, @name='Attribution-NonCommercial', @permissive=60
EXEC add_LicensePermission @id=6, @name='Attribution-NonCommercial-ShareAlike', @permissive=50
EXEC add_LicensePermission @id=7, @name='Attribution-NonCommercial-NoDerivs', @permissive=40
EXEC add_LicensePermission @id=8, @name='Quote 1000+', @permissive=30
EXEC add_LicensePermission @id=9, @name='Quote 500+', @permissive=20
EXEC add_LicensePermission @id=10, @name='Quote 250+', @permissive=10
EXEC add_LicensePermission @id=11, @name='Restricted', @permissive=0


----------------------------------------------------------------------------
-- LicenseTypes
----------------------------------------------------------------------------
EXEC add_LicenseType @id=1, @name='Public Domain', @free=1, @permId=1
EXEC add_LicenseType @id=2, @name='Patent Letters', @free=1, @permId=1
EXEC add_LicenseType @id=3, @name='Creative Commons Attribution Share-Alike', @free=1, @permId=3
EXEC add_LicenseType @id=4, @name='Creative Commons Attribution-Noncommercial-No Derivatives', @free=1, @permId=7
EXEC add_LicenseType @id=5, @name='Creative Commons Attribution-NoDerivs', @free=1, @permId=4
EXEC add_LicenseType @id=6, @name='Free Noncommercial Distribution', @free=1, @permId=7
EXEC add_LicenseType @id=7, @name='Commercial', @free=0, @permId=NULL
EXEC add_LicenseType @id=8, @name='Commercial Quote 1000+', @free=0, @permId=8
EXEC add_LicenseType @id=9, @name='Commercial Quote 500+', @free=0, @permId=9
EXEC add_LicenseType @id=10, @name='Commercial Quote 250+', @free=0, @permId=10
EXEC add_LicenseType @id=11, @name='Commercial Restricted', @free=0, @permId=11
EXEC add_LicenseType @id=12, @name='Creative Commons Attribution', @free=1, @permId=2


----------------------------------------------------------------------------
-- ResourceTypes
----------------------------------------------------------------------------
EXEC add_ResourceType @id='api', @name='Bible Api'
EXEC add_ResourceType @id='edition', @name='Bible Edition'
EXEC add_ResourceType @id='file', @name='Bible File'
EXEC add_ResourceType @id='license', @name='Bible License'
EXEC add_ResourceType @id='read', @name='Bible Browser'
EXEC add_ResourceType @id='version', @name='Bible Version'


----------------------------------------------------------------------------
-- Sections
----------------------------------------------------------------------------
EXEC add_Section @id=101000000, @name='Law', @canonId=100000000
EXEC add_Section @id=106000000, @name='History', @canonId=100000000
EXEC add_Section @id=118000000, @name='Wisdom', @canonId=100000000
EXEC add_Section @id=123000000, @name='Major Prophets', @canonId=100000000
EXEC add_Section @id=128000000, @name='Minor Prophets', @canonId=100000000
EXEC add_Section @id=340000000, @name='Gospels', @canonId=300000000
EXEC add_Section @id=344000000, @name='Acts', @canonId=300000000
EXEC add_Section @id=345000000, @name='Pauline Epistles', @canonId=300000000
EXEC add_Section @id=358000000, @name='General Epistles', @canonId=300000000
EXEC add_Section @id=366000000, @name='Revelation', @canonId=300000000


----------------------------------------------------------------------------
-- Books
----------------------------------------------------------------------------
EXEC add_Book @id=101000000, @name='Genesis', @abbrev='Gen', @code='gen', @osis='Gen', @para='GEN', @book=1, @canonId=100000000, @sectionId=101000000, @secEnd=0, @chapters=50
EXEC add_Book @id=102000000, @name='Exodus', @abbrev='Exo', @code='exo', @osis='Exod', @para='EXO', @book=2, @canonId=100000000, @sectionId=101000000, @secEnd=0, @chapters=40
EXEC add_Book @id=103000000, @name='Leviticus', @abbrev='Lev', @code='lev', @osis='Lev', @para='LEV', @book=3, @canonId=100000000, @sectionId=101000000, @secEnd=0, @chapters=27
EXEC add_Book @id=104000000, @name='Numbers', @abbrev='Num', @code='num', @osis='Num', @para='NUM', @book=4, @canonId=100000000, @sectionId=101000000, @secEnd=0, @chapters=36
EXEC add_Book @id=105000000, @name='Deuteronomy', @abbrev='Deut', @code='deut', @osis='Deut', @para='DEU', @book=5, @canonId=100000000, @sectionId=101000000, @secEnd=1, @chapters=34
EXEC add_Book @id=106000000, @name='Joshua', @abbrev='Josh', @code='josh', @osis='Josh', @para='JOS', @book=6, @canonId=100000000, @sectionId=106000000, @secEnd=0, @chapters=24
EXEC add_Book @id=107000000, @name='Judges', @abbrev='Judg', @code='judg', @osis='Judg', @para='JDG', @book=7, @canonId=100000000, @sectionId=106000000, @secEnd=0, @chapters=21
EXEC add_Book @id=108000000, @name='Ruth', @abbrev='Ruth', @code='ruth', @osis='Ruth', @para='RUT', @book=8, @canonId=100000000, @sectionId=106000000, @secEnd=0, @chapters=4
EXEC add_Book @id=109000000, @name='1 Samuel', @abbrev='1Sa', @code='1sa', @osis='1Sam', @para='1SA', @book=9, @canonId=100000000, @sectionId=106000000, @secEnd=0, @chapters=31
EXEC add_Book @id=110000000, @name='2 Samuel', @abbrev='2Sa', @code='2sa', @osis='2Sam', @para='2SA', @book=10, @canonId=100000000, @sectionId=106000000, @secEnd=0, @chapters=24
EXEC add_Book @id=111000000, @name='1 Kings', @abbrev='1Ki', @code='1ki', @osis='1Kgs', @para='1KI', @book=11, @canonId=100000000, @sectionId=106000000, @secEnd=0, @chapters=22
EXEC add_Book @id=112000000, @name='2 Kings', @abbrev='2Ki', @code='2ki', @osis='2Kgs', @para='2KI', @book=12, @canonId=100000000, @sectionId=106000000, @secEnd=0, @chapters=25
EXEC add_Book @id=113000000, @name='1 Chronicles', @abbrev='1Ch', @code='1ch', @osis='1Chr', @para='1CH', @book=13, @canonId=100000000, @sectionId=106000000, @secEnd=0, @chapters=29
EXEC add_Book @id=114000000, @name='2 Chronicles', @abbrev='2Ch', @code='2ch', @osis='2Chr', @para='2CH', @book=14, @canonId=100000000, @sectionId=106000000, @secEnd=0, @chapters=36
EXEC add_Book @id=115000000, @name='Ezra', @abbrev='Ezra', @code='ezra', @osis='Ezra', @para='EZR', @book=15, @canonId=100000000, @sectionId=106000000, @secEnd=0, @chapters=10
EXEC add_Book @id=116000000, @name='Nehemiah', @abbrev='Neh', @code='neh', @osis='Neh', @para='NEH', @book=16, @canonId=100000000, @sectionId=106000000, @secEnd=0, @chapters=13
EXEC add_Book @id=117000000, @name='Esther', @abbrev='Est', @code='est', @osis='Esth', @para='EST', @book=17, @canonId=100000000, @sectionId=106000000, @secEnd=1, @chapters=10
EXEC add_Book @id=118000000, @name='Job', @abbrev='Job', @code='job', @osis='Job', @para='JOB', @book=18, @canonId=100000000, @sectionId=118000000, @secEnd=0, @chapters=42
EXEC add_Book @id=119000000, @name='Psalms', @abbrev='Ps', @code='ps', @osis='Ps', @para='PSA', @book=19, @canonId=100000000, @sectionId=118000000, @secEnd=0, @chapters=150
EXEC add_Book @id=120000000, @name='Proverbs', @abbrev='Pro', @code='pro', @osis='Prov', @para='PRO', @book=20, @canonId=100000000, @sectionId=118000000, @secEnd=0, @chapters=31
EXEC add_Book @id=121000000, @name='Ecclesiastes', @abbrev='Ecc', @code='ecc', @osis='Eccl', @para='ECC', @book=21, @canonId=100000000, @sectionId=118000000, @secEnd=0, @chapters=12
EXEC add_Book @id=122000000, @name='Song of Songs', @abbrev='Song', @code='song', @osis='Song', @para='SNG', @book=22, @canonId=100000000, @sectionId=118000000, @secEnd=1, @chapters=8
EXEC add_Book @id=123000000, @name='Isaiah', @abbrev='Isa', @code='isa', @osis='Isa', @para='ISA', @book=23, @canonId=100000000, @sectionId=123000000, @secEnd=0, @chapters=66
EXEC add_Book @id=124000000, @name='Jeremiah', @abbrev='Jer', @code='jer', @osis='Jer', @para='JER', @book=24, @canonId=100000000, @sectionId=123000000, @secEnd=0, @chapters=52
EXEC add_Book @id=125000000, @name='Lamentations', @abbrev='Lam', @code='lam', @osis='Lam', @para='LAM', @book=25, @canonId=100000000, @sectionId=123000000, @secEnd=0, @chapters=5
EXEC add_Book @id=126000000, @name='Ezekiel', @abbrev='Ezek', @code='ezek', @osis='Ezek', @para='EZK', @book=26, @canonId=100000000, @sectionId=123000000, @secEnd=0, @chapters=48
EXEC add_Book @id=127000000, @name='Daniel', @abbrev='Dan', @code='dan', @osis='Dan', @para='DAN', @book=27, @canonId=100000000, @sectionId=123000000, @secEnd=1, @chapters=12
EXEC add_Book @id=128000000, @name='Hosea', @abbrev='Hos', @code='hos', @osis='Hos', @para='HOS', @book=28, @canonId=100000000, @sectionId=128000000, @secEnd=0, @chapters=14
EXEC add_Book @id=129000000, @name='Joel', @abbrev='Joel', @code='joel', @osis='Joel', @para='JOL', @book=29, @canonId=100000000, @sectionId=128000000, @secEnd=0, @chapters=3
EXEC add_Book @id=130000000, @name='Amos', @abbrev='Amos', @code='amos', @osis='Amos', @para='AMO', @book=30, @canonId=100000000, @sectionId=128000000, @secEnd=0, @chapters=9
EXEC add_Book @id=131000000, @name='Obadiah', @abbrev='Oba', @code='oba', @osis='Obad', @para='OBA', @book=31, @canonId=100000000, @sectionId=128000000, @secEnd=0, @chapters=1
EXEC add_Book @id=132000000, @name='Jonah', @abbrev='Jonah', @code='jonah', @osis='Jonah', @para='JON', @book=32, @canonId=100000000, @sectionId=128000000, @secEnd=0, @chapters=4
EXEC add_Book @id=133000000, @name='Micah', @abbrev='Mic', @code='mic', @osis='Mic', @para='MIC', @book=33, @canonId=100000000, @sectionId=128000000, @secEnd=0, @chapters=7
EXEC add_Book @id=134000000, @name='Nahum', @abbrev='Nah', @code='nah', @osis='Nah', @para='NAM', @book=34, @canonId=100000000, @sectionId=128000000, @secEnd=0, @chapters=3
EXEC add_Book @id=135000000, @name='Habakkuk', @abbrev='Hab', @code='hab', @osis='Hab', @para='HAB', @book=35, @canonId=100000000, @sectionId=128000000, @secEnd=0, @chapters=3
EXEC add_Book @id=136000000, @name='Zephaniah', @abbrev='Zeph', @code='zeph', @osis='Zeph', @para='ZEP', @book=36, @canonId=100000000, @sectionId=128000000, @secEnd=0, @chapters=3
EXEC add_Book @id=137000000, @name='Haggai', @abbrev='Hag', @code='hag', @osis='Hag', @para='HAG', @book=37, @canonId=100000000, @sectionId=128000000, @secEnd=0, @chapters=2
EXEC add_Book @id=138000000, @name='Zechariah', @abbrev='Zec', @code='zec', @osis='Zech', @para='ZEC', @book=38, @canonId=100000000, @sectionId=128000000, @secEnd=0, @chapters=14
EXEC add_Book @id=139000000, @name='Malachi', @abbrev='Mal', @code='mal', @osis='Mal', @para='MAL', @book=39, @canonId=100000000, @sectionId=128000000, @secEnd=1, @chapters=4
EXEC add_Book @id=340000000, @name='Matthew', @abbrev='Matt', @code='matt', @osis='Matt', @para='MAT', @book=40, @canonId=300000000, @sectionId=340000000, @secEnd=0, @chapters=28
EXEC add_Book @id=341000000, @name='Mark', @abbrev='Mark', @code='mark', @osis='Mark', @para='MRK', @book=41, @canonId=300000000, @sectionId=340000000, @secEnd=0, @chapters=16
EXEC add_Book @id=342000000, @name='Luke', @abbrev='Luke', @code='luke', @osis='Luke', @para='LUK', @book=42, @canonId=300000000, @sectionId=340000000, @secEnd=0, @chapters=24
EXEC add_Book @id=343000000, @name='John', @abbrev='John', @code='john', @osis='John', @para='JHN', @book=43, @canonId=300000000, @sectionId=340000000, @secEnd=1, @chapters=21
EXEC add_Book @id=344000000, @name='Acts', @abbrev='Acts', @code='acts', @osis='Acts', @para='ACT', @book=44, @canonId=300000000, @sectionId=344000000, @secEnd=1, @chapters=28
EXEC add_Book @id=345000000, @name='Romans', @abbrev='Rom', @code='rom', @osis='Rom', @para='ROM', @book=45, @canonId=300000000, @sectionId=345000000, @secEnd=0, @chapters=16
EXEC add_Book @id=346000000, @name='1 Corinthians', @abbrev='1Co', @code='1co', @osis='1Cor', @para='1CO', @book=46, @canonId=300000000, @sectionId=345000000, @secEnd=0, @chapters=16
EXEC add_Book @id=347000000, @name='2 Corinthians', @abbrev='2Co', @code='2co', @osis='2Cor', @para='2CO', @book=47, @canonId=300000000, @sectionId=345000000, @secEnd=0, @chapters=13
EXEC add_Book @id=348000000, @name='Galatians', @abbrev='Gal', @code='gal', @osis='Gal', @para='GAL', @book=48, @canonId=300000000, @sectionId=345000000, @secEnd=0, @chapters=6
EXEC add_Book @id=349000000, @name='Ephesians', @abbrev='Eph', @code='eph', @osis='Eph', @para='EPH', @book=49, @canonId=300000000, @sectionId=345000000, @secEnd=0, @chapters=6
EXEC add_Book @id=350000000, @name='Philippians', @abbrev='Php', @code='php', @osis='Phil', @para='PHP', @book=50, @canonId=300000000, @sectionId=345000000, @secEnd=0, @chapters=4
EXEC add_Book @id=351000000, @name='Colossians', @abbrev='Col', @code='col', @osis='Col', @para='COL', @book=51, @canonId=300000000, @sectionId=345000000, @secEnd=0, @chapters=4
EXEC add_Book @id=352000000, @name='1 Thessalonians', @abbrev='1Th', @code='1th', @osis='1Thess', @para='1TH', @book=52, @canonId=300000000, @sectionId=345000000, @secEnd=0, @chapters=5
EXEC add_Book @id=353000000, @name='2 Thessalonians', @abbrev='2Th', @code='2th', @osis='2Thess', @para='2TH', @book=53, @canonId=300000000, @sectionId=345000000, @secEnd=1, @chapters=3
EXEC add_Book @id=354000000, @name='1 Timothy', @abbrev='1Tim', @code='1tim', @osis='1Tim', @para='1TI', @book=54, @canonId=300000000, @sectionId=345000000, @secEnd=0, @chapters=6
EXEC add_Book @id=355000000, @name='2 Timothy', @abbrev='2Tim', @code='2tim', @osis='2Tim', @para='2Ti', @book=55, @canonId=300000000, @sectionId=345000000, @secEnd=0, @chapters=4
EXEC add_Book @id=356000000, @name='Titus', @abbrev='Titus', @code='Titus', @osis='Titus', @para='TIT', @book=56, @canonId=300000000, @sectionId=345000000, @secEnd=0, @chapters=3
EXEC add_Book @id=357000000, @name='Philemon', @abbrev='Phlm', @code='phlm', @osis='Phlm', @para='PHM', @book=57, @canonId=300000000, @sectionId=345000000, @secEnd=1, @chapters=1
EXEC add_Book @id=358000000, @name='Hebrews', @abbrev='Heb', @code='heb', @osis='Heb', @para='HEB', @book=58, @canonId=300000000, @sectionId=358000000, @secEnd=1, @chapters=13
EXEC add_Book @id=359000000, @name='James', @abbrev='James', @code='james', @osis='Jas', @para='JAS', @book=59, @canonId=300000000, @sectionId=358000000, @secEnd=0, @chapters=5
EXEC add_Book @id=360000000, @name='1 Peter', @abbrev='1Pe', @code='1pe', @osis='1Pet', @para='1PE', @book=60, @canonId=300000000, @sectionId=358000000, @secEnd=0, @chapters=5
EXEC add_Book @id=361000000, @name='2 Peter', @abbrev='2Pe', @code='2pe', @osis='2Pet', @para='2PE', @book=61, @canonId=300000000, @sectionId=358000000, @secEnd=0, @chapters=3
EXEC add_Book @id=362000000, @name='1 John', @abbrev='1John', @code='1john', @osis='1John', @para='1JN', @book=62, @canonId=300000000, @sectionId=358000000, @secEnd=0, @chapters=5
EXEC add_Book @id=363000000, @name='2 John', @abbrev='2John', @code='2john', @osis='2John', @para='2JN', @book=63, @canonId=300000000, @sectionId=358000000, @secEnd=0, @chapters=1
EXEC add_Book @id=364000000, @name='3 John', @abbrev='3John', @code='3john', @osis='3John', @para='3JN', @book=64, @canonId=300000000, @sectionId=358000000, @secEnd=0, @chapters=1
EXEC add_Book @id=365000000, @name='Jude', @abbrev='Jude', @code='jude', @osis='Jude', @para='JUD', @book=65, @canonId=300000000, @sectionId=358000000, @secEnd=1, @chapters=1
EXEC add_Book @id=366000000, @name='Revelation', @abbrev='Rev', @code='rev', @osis='Rev', @para='REV', @book=66, @canonId=300000000, @sectionId=366000000, @secEnd=0, @chapters=22


----------------------------------------------------------------------------
-- BookNames
----------------------------------------------------------------------------
EXEC add_BookName @name='1 chronicles',@bookId=113000000
EXEC add_BookName @name='1 corinthians',@bookId=346000000
EXEC add_BookName @name='1 john',@bookId=362000000
EXEC add_BookName @name='1 kings',@bookId=111000000
EXEC add_BookName @name='1 peter',@bookId=360000000
EXEC add_BookName @name='1 samuel',@bookId=109000000
EXEC add_BookName @name='1 thessalonians',@bookId=352000000
EXEC add_BookName @name='1 timothy',@bookId=354000000
EXEC add_BookName @name='1ch',@bookId=113000000
EXEC add_BookName @name='1chr',@bookId=113000000
EXEC add_BookName @name='1co',@bookId=346000000
EXEC add_BookName @name='1cor',@bookId=346000000
EXEC add_BookName @name='1j',@bookId=362000000
EXEC add_BookName @name='1jn',@bookId=362000000
EXEC add_BookName @name='1jo',@bookId=362000000
EXEC add_BookName @name='1john',@bookId=362000000
EXEC add_BookName @name='1kgs',@bookId=111000000
EXEC add_BookName @name='1ki',@bookId=111000000
EXEC add_BookName @name='1p',@bookId=360000000
EXEC add_BookName @name='1pe',@bookId=360000000
EXEC add_BookName @name='1pet',@bookId=360000000
EXEC add_BookName @name='1sa',@bookId=109000000
EXEC add_BookName @name='1sam',@bookId=109000000
EXEC add_BookName @name='1th',@bookId=352000000
EXEC add_BookName @name='1thess',@bookId=352000000
EXEC add_BookName @name='1ti',@bookId=354000000
EXEC add_BookName @name='1tim',@bookId=354000000
EXEC add_BookName @name='2 chronicles',@bookId=114000000
EXEC add_BookName @name='2 corinthians',@bookId=347000000
EXEC add_BookName @name='2 john',@bookId=363000000
EXEC add_BookName @name='2 kings',@bookId=112000000
EXEC add_BookName @name='2 peter',@bookId=361000000
EXEC add_BookName @name='2 samuel',@bookId=110000000
EXEC add_BookName @name='2 thessalonians',@bookId=353000000
EXEC add_BookName @name='2 timothy',@bookId=355000000
EXEC add_BookName @name='2ch',@bookId=114000000
EXEC add_BookName @name='2chr',@bookId=114000000
EXEC add_BookName @name='2co',@bookId=347000000
EXEC add_BookName @name='2cor',@bookId=347000000
EXEC add_BookName @name='2j',@bookId=363000000
EXEC add_BookName @name='2jn',@bookId=363000000
EXEC add_BookName @name='2jo',@bookId=363000000
EXEC add_BookName @name='2john',@bookId=363000000
EXEC add_BookName @name='2kgs',@bookId=112000000
EXEC add_BookName @name='2ki',@bookId=112000000
EXEC add_BookName @name='2p',@bookId=361000000
EXEC add_BookName @name='2pe',@bookId=361000000
EXEC add_BookName @name='2pet',@bookId=361000000
EXEC add_BookName @name='2sa',@bookId=110000000
EXEC add_BookName @name='2sam',@bookId=110000000
EXEC add_BookName @name='2th',@bookId=353000000
EXEC add_BookName @name='2thess',@bookId=353000000
EXEC add_BookName @name='2ti',@bookId=355000000
EXEC add_BookName @name='2tim',@bookId=355000000
EXEC add_BookName @name='3 john',@bookId=364000000
EXEC add_BookName @name='3j',@bookId=364000000
EXEC add_BookName @name='3jn',@bookId=364000000
EXEC add_BookName @name='3jo',@bookId=364000000
EXEC add_BookName @name='3john',@bookId=364000000
EXEC add_BookName @name='ac',@bookId=344000000
EXEC add_BookName @name='act',@bookId=344000000
EXEC add_BookName @name='acts',@bookId=344000000
EXEC add_BookName @name='am',@bookId=130000000
EXEC add_BookName @name='amo',@bookId=130000000
EXEC add_BookName @name='amos',@bookId=130000000
EXEC add_BookName @name='apocalypse',@bookId=366000000
EXEC add_BookName @name='ca',@bookId=122000000
EXEC add_BookName @name='canticles',@bookId=122000000
EXEC add_BookName @name='col',@bookId=351000000
EXEC add_BookName @name='colossians',@bookId=351000000
EXEC add_BookName @name='da',@bookId=127000000
EXEC add_BookName @name='dan',@bookId=127000000
EXEC add_BookName @name='daniel',@bookId=127000000
EXEC add_BookName @name='deu',@bookId=105000000
EXEC add_BookName @name='deut',@bookId=105000000
EXEC add_BookName @name='deuteronomy',@bookId=105000000
EXEC add_BookName @name='ec',@bookId=121000000
EXEC add_BookName @name='ecc',@bookId=121000000
EXEC add_BookName @name='eccl',@bookId=121000000
EXEC add_BookName @name='ecclesiastes',@bookId=121000000
EXEC add_BookName @name='eph',@bookId=349000000
EXEC add_BookName @name='ephesians',@bookId=349000000
EXEC add_BookName @name='es',@bookId=117000000
EXEC add_BookName @name='est',@bookId=117000000
EXEC add_BookName @name='esth',@bookId=117000000
EXEC add_BookName @name='esther',@bookId=117000000
EXEC add_BookName @name='ex',@bookId=102000000
EXEC add_BookName @name='exo',@bookId=102000000
EXEC add_BookName @name='exod',@bookId=102000000
EXEC add_BookName @name='exodus',@bookId=102000000
EXEC add_BookName @name='ez',@bookId=126000000
EXEC add_BookName @name='eze',@bookId=126000000
EXEC add_BookName @name='ezek',@bookId=126000000
EXEC add_BookName @name='ezekiel',@bookId=126000000
EXEC add_BookName @name='ezk',@bookId=126000000
EXEC add_BookName @name='ezr',@bookId=115000000
EXEC add_BookName @name='ezra',@bookId=115000000
EXEC add_BookName @name='ga',@bookId=348000000
EXEC add_BookName @name='gal',@bookId=348000000
EXEC add_BookName @name='galatians',@bookId=348000000
EXEC add_BookName @name='ge',@bookId=101000000
EXEC add_BookName @name='gen',@bookId=101000000
EXEC add_BookName @name='genesis',@bookId=101000000
EXEC add_BookName @name='hab',@bookId=135000000
EXEC add_BookName @name='habakkuk',@bookId=135000000
EXEC add_BookName @name='hag',@bookId=137000000
EXEC add_BookName @name='haggai',@bookId=137000000
EXEC add_BookName @name='heb',@bookId=358000000
EXEC add_BookName @name='hebrews',@bookId=358000000
EXEC add_BookName @name='ho',@bookId=128000000
EXEC add_BookName @name='hos',@bookId=128000000
EXEC add_BookName @name='hosea',@bookId=128000000
EXEC add_BookName @name='i chronicles',@bookId=113000000
EXEC add_BookName @name='i corinthians',@bookId=346000000
EXEC add_BookName @name='i john',@bookId=362000000
EXEC add_BookName @name='i kings',@bookId=111000000
EXEC add_BookName @name='i peter',@bookId=360000000
EXEC add_BookName @name='i samuel',@bookId=109000000
EXEC add_BookName @name='i thessalonians',@bookId=352000000
EXEC add_BookName @name='i timothy',@bookId=354000000
EXEC add_BookName @name='ii chronicles',@bookId=114000000
EXEC add_BookName @name='ii corinthians',@bookId=347000000
EXEC add_BookName @name='ii john',@bookId=363000000
EXEC add_BookName @name='ii kings',@bookId=112000000
EXEC add_BookName @name='ii peter',@bookId=361000000
EXEC add_BookName @name='ii samuel',@bookId=110000000
EXEC add_BookName @name='ii thessalonians',@bookId=353000000
EXEC add_BookName @name='ii timothy',@bookId=355000000
EXEC add_BookName @name='iii john',@bookId=364000000
EXEC add_BookName @name='isa',@bookId=123000000
EXEC add_BookName @name='isaiah',@bookId=123000000
EXEC add_BookName @name='james',@bookId=359000000
EXEC add_BookName @name='jas',@bookId=359000000
EXEC add_BookName @name='jdg',@bookId=107000000
EXEC add_BookName @name='jer',@bookId=124000000
EXEC add_BookName @name='jeremiah',@bookId=124000000
EXEC add_BookName @name='jg',@bookId=107000000
EXEC add_BookName @name='jhn',@bookId=343000000
EXEC add_BookName @name='jms',@bookId=359000000
EXEC add_BookName @name='jnh',@bookId=132000000
EXEC add_BookName @name='job',@bookId=118000000
EXEC add_BookName @name='joe',@bookId=129000000
EXEC add_BookName @name='joel',@bookId=129000000
EXEC add_BookName @name='joh',@bookId=343000000
EXEC add_BookName @name='john',@bookId=343000000
EXEC add_BookName @name='jol',@bookId=129000000
EXEC add_BookName @name='jon',@bookId=132000000
EXEC add_BookName @name='jonah',@bookId=132000000
EXEC add_BookName @name='jos',@bookId=106000000
EXEC add_BookName @name='josh',@bookId=106000000
EXEC add_BookName @name='joshua',@bookId=106000000
EXEC add_BookName @name='jud',@bookId=365000000
EXEC add_BookName @name='jude',@bookId=365000000
EXEC add_BookName @name='judg',@bookId=107000000
EXEC add_BookName @name='judges',@bookId=107000000
EXEC add_BookName @name='la',@bookId=125000000
EXEC add_BookName @name='lam',@bookId=125000000
EXEC add_BookName @name='lamentations',@bookId=125000000
EXEC add_BookName @name='le',@bookId=103000000
EXEC add_BookName @name='lev',@bookId=103000000
EXEC add_BookName @name='leviticus',@bookId=103000000
EXEC add_BookName @name='lu',@bookId=342000000
EXEC add_BookName @name='luk',@bookId=342000000
EXEC add_BookName @name='luke',@bookId=342000000
EXEC add_BookName @name='mal',@bookId=139000000
EXEC add_BookName @name='malachi',@bookId=139000000
EXEC add_BookName @name='mark',@bookId=341000000
EXEC add_BookName @name='mat',@bookId=340000000
EXEC add_BookName @name='matt',@bookId=340000000
EXEC add_BookName @name='matthew',@bookId=340000000
EXEC add_BookName @name='mic',@bookId=133000000
EXEC add_BookName @name='micah',@bookId=133000000
EXEC add_BookName @name='mr',@bookId=341000000
EXEC add_BookName @name='mrk',@bookId=341000000
EXEC add_BookName @name='mt',@bookId=340000000
EXEC add_BookName @name='na',@bookId=134000000
EXEC add_BookName @name='nah',@bookId=134000000
EXEC add_BookName @name='nahum',@bookId=134000000
EXEC add_BookName @name='nam',@bookId=134000000
EXEC add_BookName @name='ne',@bookId=116000000
EXEC add_BookName @name='neh',@bookId=116000000
EXEC add_BookName @name='nehemiah',@bookId=116000000
EXEC add_BookName @name='nu',@bookId=104000000
EXEC add_BookName @name='num',@bookId=104000000
EXEC add_BookName @name='numbers',@bookId=104000000
EXEC add_BookName @name='ob',@bookId=131000000
EXEC add_BookName @name='oba',@bookId=131000000
EXEC add_BookName @name='obad',@bookId=131000000
EXEC add_BookName @name='obadiah',@bookId=131000000
EXEC add_BookName @name='phi',@bookId=350000000
EXEC add_BookName @name='phil',@bookId=350000000
EXEC add_BookName @name='philemon',@bookId=357000000
EXEC add_BookName @name='philippians',@bookId=350000000
EXEC add_BookName @name='phlm',@bookId=357000000
EXEC add_BookName @name='phm',@bookId=357000000
EXEC add_BookName @name='php',@bookId=350000000
EXEC add_BookName @name='pr',@bookId=120000000
EXEC add_BookName @name='pro',@bookId=120000000
EXEC add_BookName @name='prov',@bookId=120000000
EXEC add_BookName @name='proverbs',@bookId=120000000
EXEC add_BookName @name='ps',@bookId=119000000
EXEC add_BookName @name='psa',@bookId=119000000
EXEC add_BookName @name='psalm',@bookId=119000000
EXEC add_BookName @name='psalms',@bookId=119000000
EXEC add_BookName @name='re',@bookId=366000000
EXEC add_BookName @name='rev',@bookId=366000000
EXEC add_BookName @name='revelation',@bookId=366000000
EXEC add_BookName @name='ro',@bookId=345000000
EXEC add_BookName @name='rom',@bookId=345000000
EXEC add_BookName @name='romans',@bookId=345000000
EXEC add_BookName @name='ru',@bookId=108000000
EXEC add_BookName @name='rut',@bookId=108000000
EXEC add_BookName @name='ruth',@bookId=108000000
EXEC add_BookName @name='sng',@bookId=122000000
EXEC add_BookName @name='song',@bookId=122000000
EXEC add_BookName @name='song of solomon',@bookId=122000000
EXEC add_BookName @name='song of songs',@bookId=122000000
EXEC add_BookName @name='songs',@bookId=122000000
EXEC add_BookName @name='ti',@bookId=356000000
EXEC add_BookName @name='tit',@bookId=356000000
EXEC add_BookName @name='titus',@bookId=356000000
EXEC add_BookName @name='zec',@bookId=138000000
EXEC add_BookName @name='zech',@bookId=138000000
EXEC add_BookName @name='zechariah',@bookId=138000000
EXEC add_BookName @name='zep',@bookId=136000000
EXEC add_BookName @name='zeph',@bookId=136000000
EXEC add_BookName @name='zephaniah',@bookId=136000000


----------------------------------------------------------------------------
-- Chapters
----------------------------------------------------------------------------
EXEC add_Chapter @id=101001000, @code='gen-1', @ref='Gen 1', @ch=1, @verses=31, @bkId=101000000
EXEC add_Chapter @id=101002000, @code='gen-2', @ref='Gen 2', @ch=2, @verses=25, @bkId=101000000
EXEC add_Chapter @id=101003000, @code='gen-3', @ref='Gen 3', @ch=3, @verses=24, @bkId=101000000
EXEC add_Chapter @id=101004000, @code='gen-4', @ref='Gen 4', @ch=4, @verses=26, @bkId=101000000
EXEC add_Chapter @id=101005000, @code='gen-5', @ref='Gen 5', @ch=5, @verses=32, @bkId=101000000
EXEC add_Chapter @id=101006000, @code='gen-6', @ref='Gen 6', @ch=6, @verses=22, @bkId=101000000
EXEC add_Chapter @id=101007000, @code='gen-7', @ref='Gen 7', @ch=7, @verses=24, @bkId=101000000
EXEC add_Chapter @id=101008000, @code='gen-8', @ref='Gen 8', @ch=8, @verses=22, @bkId=101000000
EXEC add_Chapter @id=101009000, @code='gen-9', @ref='Gen 9', @ch=9, @verses=29, @bkId=101000000
EXEC add_Chapter @id=101010000, @code='gen-10', @ref='Gen 10', @ch=10, @verses=32, @bkId=101000000
EXEC add_Chapter @id=101011000, @code='gen-11', @ref='Gen 11', @ch=11, @verses=32, @bkId=101000000
EXEC add_Chapter @id=101012000, @code='gen-12', @ref='Gen 12', @ch=12, @verses=20, @bkId=101000000
EXEC add_Chapter @id=101013000, @code='gen-13', @ref='Gen 13', @ch=13, @verses=18, @bkId=101000000
EXEC add_Chapter @id=101014000, @code='gen-14', @ref='Gen 14', @ch=14, @verses=24, @bkId=101000000
EXEC add_Chapter @id=101015000, @code='gen-15', @ref='Gen 15', @ch=15, @verses=21, @bkId=101000000
EXEC add_Chapter @id=101016000, @code='gen-16', @ref='Gen 16', @ch=16, @verses=16, @bkId=101000000
EXEC add_Chapter @id=101017000, @code='gen-17', @ref='Gen 17', @ch=17, @verses=27, @bkId=101000000
EXEC add_Chapter @id=101018000, @code='gen-18', @ref='Gen 18', @ch=18, @verses=33, @bkId=101000000
EXEC add_Chapter @id=101019000, @code='gen-19', @ref='Gen 19', @ch=19, @verses=38, @bkId=101000000
EXEC add_Chapter @id=101020000, @code='gen-20', @ref='Gen 20', @ch=20, @verses=18, @bkId=101000000
EXEC add_Chapter @id=101021000, @code='gen-21', @ref='Gen 21', @ch=21, @verses=34, @bkId=101000000
EXEC add_Chapter @id=101022000, @code='gen-22', @ref='Gen 22', @ch=22, @verses=24, @bkId=101000000
EXEC add_Chapter @id=101023000, @code='gen-23', @ref='Gen 23', @ch=23, @verses=20, @bkId=101000000
EXEC add_Chapter @id=101024000, @code='gen-24', @ref='Gen 24', @ch=24, @verses=67, @bkId=101000000
EXEC add_Chapter @id=101025000, @code='gen-25', @ref='Gen 25', @ch=25, @verses=34, @bkId=101000000
EXEC add_Chapter @id=101026000, @code='gen-26', @ref='Gen 26', @ch=26, @verses=35, @bkId=101000000
EXEC add_Chapter @id=101027000, @code='gen-27', @ref='Gen 27', @ch=27, @verses=46, @bkId=101000000
EXEC add_Chapter @id=101028000, @code='gen-28', @ref='Gen 28', @ch=28, @verses=22, @bkId=101000000
EXEC add_Chapter @id=101029000, @code='gen-29', @ref='Gen 29', @ch=29, @verses=35, @bkId=101000000
EXEC add_Chapter @id=101030000, @code='gen-30', @ref='Gen 30', @ch=30, @verses=43, @bkId=101000000
EXEC add_Chapter @id=101031000, @code='gen-31', @ref='Gen 31', @ch=31, @verses=55, @bkId=101000000
EXEC add_Chapter @id=101032000, @code='gen-32', @ref='Gen 32', @ch=32, @verses=32, @bkId=101000000
EXEC add_Chapter @id=101033000, @code='gen-33', @ref='Gen 33', @ch=33, @verses=20, @bkId=101000000
EXEC add_Chapter @id=101034000, @code='gen-34', @ref='Gen 34', @ch=34, @verses=31, @bkId=101000000
EXEC add_Chapter @id=101035000, @code='gen-35', @ref='Gen 35', @ch=35, @verses=29, @bkId=101000000
EXEC add_Chapter @id=101036000, @code='gen-36', @ref='Gen 36', @ch=36, @verses=43, @bkId=101000000
EXEC add_Chapter @id=101037000, @code='gen-37', @ref='Gen 37', @ch=37, @verses=36, @bkId=101000000
EXEC add_Chapter @id=101038000, @code='gen-38', @ref='Gen 38', @ch=38, @verses=30, @bkId=101000000
EXEC add_Chapter @id=101039000, @code='gen-39', @ref='Gen 39', @ch=39, @verses=23, @bkId=101000000
EXEC add_Chapter @id=101040000, @code='gen-40', @ref='Gen 40', @ch=40, @verses=23, @bkId=101000000
EXEC add_Chapter @id=101041000, @code='gen-41', @ref='Gen 41', @ch=41, @verses=57, @bkId=101000000
EXEC add_Chapter @id=101042000, @code='gen-42', @ref='Gen 42', @ch=42, @verses=38, @bkId=101000000
EXEC add_Chapter @id=101043000, @code='gen-43', @ref='Gen 43', @ch=43, @verses=34, @bkId=101000000
EXEC add_Chapter @id=101044000, @code='gen-44', @ref='Gen 44', @ch=44, @verses=34, @bkId=101000000
EXEC add_Chapter @id=101045000, @code='gen-45', @ref='Gen 45', @ch=45, @verses=28, @bkId=101000000
EXEC add_Chapter @id=101046000, @code='gen-46', @ref='Gen 46', @ch=46, @verses=34, @bkId=101000000
EXEC add_Chapter @id=101047000, @code='gen-47', @ref='Gen 47', @ch=47, @verses=31, @bkId=101000000
EXEC add_Chapter @id=101048000, @code='gen-48', @ref='Gen 48', @ch=48, @verses=22, @bkId=101000000
EXEC add_Chapter @id=101049000, @code='gen-49', @ref='Gen 49', @ch=49, @verses=33, @bkId=101000000
EXEC add_Chapter @id=101050000, @code='gen-50', @ref='Gen 50', @ch=50, @verses=26, @bkId=101000000, @bkEnd=1
EXEC add_Chapter @id=102001000, @code='exo-1', @ref='Exo 1', @ch=1, @verses=22, @bkId=102000000
EXEC add_Chapter @id=102002000, @code='exo-2', @ref='Exo 2', @ch=2, @verses=25, @bkId=102000000
EXEC add_Chapter @id=102003000, @code='exo-3', @ref='Exo 3', @ch=3, @verses=22, @bkId=102000000
EXEC add_Chapter @id=102004000, @code='exo-4', @ref='Exo 4', @ch=4, @verses=31, @bkId=102000000
EXEC add_Chapter @id=102005000, @code='exo-5', @ref='Exo 5', @ch=5, @verses=23, @bkId=102000000
EXEC add_Chapter @id=102006000, @code='exo-6', @ref='Exo 6', @ch=6, @verses=30, @bkId=102000000
EXEC add_Chapter @id=102007000, @code='exo-7', @ref='Exo 7', @ch=7, @verses=25, @bkId=102000000
EXEC add_Chapter @id=102008000, @code='exo-8', @ref='Exo 8', @ch=8, @verses=32, @bkId=102000000
EXEC add_Chapter @id=102009000, @code='exo-9', @ref='Exo 9', @ch=9, @verses=35, @bkId=102000000
EXEC add_Chapter @id=102010000, @code='exo-10', @ref='Exo 10', @ch=10, @verses=29, @bkId=102000000
EXEC add_Chapter @id=102011000, @code='exo-11', @ref='Exo 11', @ch=11, @verses=10, @bkId=102000000
EXEC add_Chapter @id=102012000, @code='exo-12', @ref='Exo 12', @ch=12, @verses=51, @bkId=102000000
EXEC add_Chapter @id=102013000, @code='exo-13', @ref='Exo 13', @ch=13, @verses=22, @bkId=102000000
EXEC add_Chapter @id=102014000, @code='exo-14', @ref='Exo 14', @ch=14, @verses=31, @bkId=102000000
EXEC add_Chapter @id=102015000, @code='exo-15', @ref='Exo 15', @ch=15, @verses=27, @bkId=102000000
EXEC add_Chapter @id=102016000, @code='exo-16', @ref='Exo 16', @ch=16, @verses=36, @bkId=102000000
EXEC add_Chapter @id=102017000, @code='exo-17', @ref='Exo 17', @ch=17, @verses=16, @bkId=102000000
EXEC add_Chapter @id=102018000, @code='exo-18', @ref='Exo 18', @ch=18, @verses=27, @bkId=102000000
EXEC add_Chapter @id=102019000, @code='exo-19', @ref='Exo 19', @ch=19, @verses=25, @bkId=102000000
EXEC add_Chapter @id=102020000, @code='exo-20', @ref='Exo 20', @ch=20, @verses=26, @bkId=102000000
EXEC add_Chapter @id=102021000, @code='exo-21', @ref='Exo 21', @ch=21, @verses=36, @bkId=102000000
EXEC add_Chapter @id=102022000, @code='exo-22', @ref='Exo 22', @ch=22, @verses=31, @bkId=102000000
EXEC add_Chapter @id=102023000, @code='exo-23', @ref='Exo 23', @ch=23, @verses=33, @bkId=102000000
EXEC add_Chapter @id=102024000, @code='exo-24', @ref='Exo 24', @ch=24, @verses=18, @bkId=102000000
EXEC add_Chapter @id=102025000, @code='exo-25', @ref='Exo 25', @ch=25, @verses=40, @bkId=102000000
EXEC add_Chapter @id=102026000, @code='exo-26', @ref='Exo 26', @ch=26, @verses=37, @bkId=102000000
EXEC add_Chapter @id=102027000, @code='exo-27', @ref='Exo 27', @ch=27, @verses=21, @bkId=102000000
EXEC add_Chapter @id=102028000, @code='exo-28', @ref='Exo 28', @ch=28, @verses=43, @bkId=102000000
EXEC add_Chapter @id=102029000, @code='exo-29', @ref='Exo 29', @ch=29, @verses=46, @bkId=102000000
EXEC add_Chapter @id=102030000, @code='exo-30', @ref='Exo 30', @ch=30, @verses=38, @bkId=102000000
EXEC add_Chapter @id=102031000, @code='exo-31', @ref='Exo 31', @ch=31, @verses=18, @bkId=102000000
EXEC add_Chapter @id=102032000, @code='exo-32', @ref='Exo 32', @ch=32, @verses=35, @bkId=102000000
EXEC add_Chapter @id=102033000, @code='exo-33', @ref='Exo 33', @ch=33, @verses=23, @bkId=102000000
EXEC add_Chapter @id=102034000, @code='exo-34', @ref='Exo 34', @ch=34, @verses=35, @bkId=102000000
EXEC add_Chapter @id=102035000, @code='exo-35', @ref='Exo 35', @ch=35, @verses=35, @bkId=102000000
EXEC add_Chapter @id=102036000, @code='exo-36', @ref='Exo 36', @ch=36, @verses=38, @bkId=102000000
EXEC add_Chapter @id=102037000, @code='exo-37', @ref='Exo 37', @ch=37, @verses=29, @bkId=102000000
EXEC add_Chapter @id=102038000, @code='exo-38', @ref='Exo 38', @ch=38, @verses=31, @bkId=102000000
EXEC add_Chapter @id=102039000, @code='exo-39', @ref='Exo 39', @ch=39, @verses=43, @bkId=102000000
EXEC add_Chapter @id=102040000, @code='exo-40', @ref='Exo 40', @ch=40, @verses=38, @bkId=102000000, @bkEnd=1
EXEC add_Chapter @id=103001000, @code='lev-1', @ref='Lev 1', @ch=1, @verses=17, @bkId=103000000
EXEC add_Chapter @id=103002000, @code='lev-2', @ref='Lev 2', @ch=2, @verses=16, @bkId=103000000
EXEC add_Chapter @id=103003000, @code='lev-3', @ref='Lev 3', @ch=3, @verses=17, @bkId=103000000
EXEC add_Chapter @id=103004000, @code='lev-4', @ref='Lev 4', @ch=4, @verses=35, @bkId=103000000
EXEC add_Chapter @id=103005000, @code='lev-5', @ref='Lev 5', @ch=5, @verses=19, @bkId=103000000
EXEC add_Chapter @id=103006000, @code='lev-6', @ref='Lev 6', @ch=6, @verses=30, @bkId=103000000
EXEC add_Chapter @id=103007000, @code='lev-7', @ref='Lev 7', @ch=7, @verses=38, @bkId=103000000
EXEC add_Chapter @id=103008000, @code='lev-8', @ref='Lev 8', @ch=8, @verses=36, @bkId=103000000
EXEC add_Chapter @id=103009000, @code='lev-9', @ref='Lev 9', @ch=9, @verses=24, @bkId=103000000
EXEC add_Chapter @id=103010000, @code='lev-10', @ref='Lev 10', @ch=10, @verses=20, @bkId=103000000
EXEC add_Chapter @id=103011000, @code='lev-11', @ref='Lev 11', @ch=11, @verses=47, @bkId=103000000
EXEC add_Chapter @id=103012000, @code='lev-12', @ref='Lev 12', @ch=12, @verses=8, @bkId=103000000
EXEC add_Chapter @id=103013000, @code='lev-13', @ref='Lev 13', @ch=13, @verses=59, @bkId=103000000
EXEC add_Chapter @id=103014000, @code='lev-14', @ref='Lev 14', @ch=14, @verses=57, @bkId=103000000
EXEC add_Chapter @id=103015000, @code='lev-15', @ref='Lev 15', @ch=15, @verses=33, @bkId=103000000
EXEC add_Chapter @id=103016000, @code='lev-16', @ref='Lev 16', @ch=16, @verses=34, @bkId=103000000
EXEC add_Chapter @id=103017000, @code='lev-17', @ref='Lev 17', @ch=17, @verses=16, @bkId=103000000
EXEC add_Chapter @id=103018000, @code='lev-18', @ref='Lev 18', @ch=18, @verses=30, @bkId=103000000
EXEC add_Chapter @id=103019000, @code='lev-19', @ref='Lev 19', @ch=19, @verses=37, @bkId=103000000
EXEC add_Chapter @id=103020000, @code='lev-20', @ref='Lev 20', @ch=20, @verses=27, @bkId=103000000
EXEC add_Chapter @id=103021000, @code='lev-21', @ref='Lev 21', @ch=21, @verses=24, @bkId=103000000
EXEC add_Chapter @id=103022000, @code='lev-22', @ref='Lev 22', @ch=22, @verses=33, @bkId=103000000
EXEC add_Chapter @id=103023000, @code='lev-23', @ref='Lev 23', @ch=23, @verses=44, @bkId=103000000
EXEC add_Chapter @id=103024000, @code='lev-24', @ref='Lev 24', @ch=24, @verses=23, @bkId=103000000
EXEC add_Chapter @id=103025000, @code='lev-25', @ref='Lev 25', @ch=25, @verses=55, @bkId=103000000
EXEC add_Chapter @id=103026000, @code='lev-26', @ref='Lev 26', @ch=26, @verses=46, @bkId=103000000
EXEC add_Chapter @id=103027000, @code='lev-27', @ref='Lev 27', @ch=27, @verses=34, @bkId=103000000, @bkEnd=1
EXEC add_Chapter @id=104001000, @code='num-1', @ref='Num 1', @ch=1, @verses=54, @bkId=104000000
EXEC add_Chapter @id=104002000, @code='num-2', @ref='Num 2', @ch=2, @verses=34, @bkId=104000000
EXEC add_Chapter @id=104003000, @code='num-3', @ref='Num 3', @ch=3, @verses=51, @bkId=104000000
EXEC add_Chapter @id=104004000, @code='num-4', @ref='Num 4', @ch=4, @verses=49, @bkId=104000000
EXEC add_Chapter @id=104005000, @code='num-5', @ref='Num 5', @ch=5, @verses=31, @bkId=104000000
EXEC add_Chapter @id=104006000, @code='num-6', @ref='Num 6', @ch=6, @verses=27, @bkId=104000000
EXEC add_Chapter @id=104007000, @code='num-7', @ref='Num 7', @ch=7, @verses=89, @bkId=104000000
EXEC add_Chapter @id=104008000, @code='num-8', @ref='Num 8', @ch=8, @verses=26, @bkId=104000000
EXEC add_Chapter @id=104009000, @code='num-9', @ref='Num 9', @ch=9, @verses=23, @bkId=104000000
EXEC add_Chapter @id=104010000, @code='num-10', @ref='Num 10', @ch=10, @verses=36, @bkId=104000000
EXEC add_Chapter @id=104011000, @code='num-11', @ref='Num 11', @ch=11, @verses=35, @bkId=104000000
EXEC add_Chapter @id=104012000, @code='num-12', @ref='Num 12', @ch=12, @verses=16, @bkId=104000000
EXEC add_Chapter @id=104013000, @code='num-13', @ref='Num 13', @ch=13, @verses=33, @bkId=104000000
EXEC add_Chapter @id=104014000, @code='num-14', @ref='Num 14', @ch=14, @verses=45, @bkId=104000000
EXEC add_Chapter @id=104015000, @code='num-15', @ref='Num 15', @ch=15, @verses=41, @bkId=104000000
EXEC add_Chapter @id=104016000, @code='num-16', @ref='Num 16', @ch=16, @verses=50, @bkId=104000000
EXEC add_Chapter @id=104017000, @code='num-17', @ref='Num 17', @ch=17, @verses=13, @bkId=104000000
EXEC add_Chapter @id=104018000, @code='num-18', @ref='Num 18', @ch=18, @verses=32, @bkId=104000000
EXEC add_Chapter @id=104019000, @code='num-19', @ref='Num 19', @ch=19, @verses=22, @bkId=104000000
EXEC add_Chapter @id=104020000, @code='num-20', @ref='Num 20', @ch=20, @verses=29, @bkId=104000000
EXEC add_Chapter @id=104021000, @code='num-21', @ref='Num 21', @ch=21, @verses=35, @bkId=104000000
EXEC add_Chapter @id=104022000, @code='num-22', @ref='Num 22', @ch=22, @verses=41, @bkId=104000000
EXEC add_Chapter @id=104023000, @code='num-23', @ref='Num 23', @ch=23, @verses=30, @bkId=104000000
EXEC add_Chapter @id=104024000, @code='num-24', @ref='Num 24', @ch=24, @verses=25, @bkId=104000000
EXEC add_Chapter @id=104025000, @code='num-25', @ref='Num 25', @ch=25, @verses=18, @bkId=104000000
EXEC add_Chapter @id=104026000, @code='num-26', @ref='Num 26', @ch=26, @verses=65, @bkId=104000000
EXEC add_Chapter @id=104027000, @code='num-27', @ref='Num 27', @ch=27, @verses=23, @bkId=104000000
EXEC add_Chapter @id=104028000, @code='num-28', @ref='Num 28', @ch=28, @verses=31, @bkId=104000000
EXEC add_Chapter @id=104029000, @code='num-29', @ref='Num 29', @ch=29, @verses=40, @bkId=104000000
EXEC add_Chapter @id=104030000, @code='num-30', @ref='Num 30', @ch=30, @verses=16, @bkId=104000000
EXEC add_Chapter @id=104031000, @code='num-31', @ref='Num 31', @ch=31, @verses=54, @bkId=104000000
EXEC add_Chapter @id=104032000, @code='num-32', @ref='Num 32', @ch=32, @verses=42, @bkId=104000000
EXEC add_Chapter @id=104033000, @code='num-33', @ref='Num 33', @ch=33, @verses=56, @bkId=104000000
EXEC add_Chapter @id=104034000, @code='num-34', @ref='Num 34', @ch=34, @verses=29, @bkId=104000000
EXEC add_Chapter @id=104035000, @code='num-35', @ref='Num 35', @ch=35, @verses=34, @bkId=104000000
EXEC add_Chapter @id=104036000, @code='num-36', @ref='Num 36', @ch=36, @verses=13, @bkId=104000000, @bkEnd=1
EXEC add_Chapter @id=105001000, @code='deut-1', @ref='Deut 1', @ch=1, @verses=46, @bkId=105000000
EXEC add_Chapter @id=105002000, @code='deut-2', @ref='Deut 2', @ch=2, @verses=37, @bkId=105000000
EXEC add_Chapter @id=105003000, @code='deut-3', @ref='Deut 3', @ch=3, @verses=29, @bkId=105000000
EXEC add_Chapter @id=105004000, @code='deut-4', @ref='Deut 4', @ch=4, @verses=49, @bkId=105000000
EXEC add_Chapter @id=105005000, @code='deut-5', @ref='Deut 5', @ch=5, @verses=33, @bkId=105000000
EXEC add_Chapter @id=105006000, @code='deut-6', @ref='Deut 6', @ch=6, @verses=25, @bkId=105000000
EXEC add_Chapter @id=105007000, @code='deut-7', @ref='Deut 7', @ch=7, @verses=26, @bkId=105000000
EXEC add_Chapter @id=105008000, @code='deut-8', @ref='Deut 8', @ch=8, @verses=20, @bkId=105000000
EXEC add_Chapter @id=105009000, @code='deut-9', @ref='Deut 9', @ch=9, @verses=29, @bkId=105000000
EXEC add_Chapter @id=105010000, @code='deut-10', @ref='Deut 10', @ch=10, @verses=22, @bkId=105000000
EXEC add_Chapter @id=105011000, @code='deut-11', @ref='Deut 11', @ch=11, @verses=32, @bkId=105000000
EXEC add_Chapter @id=105012000, @code='deut-12', @ref='Deut 12', @ch=12, @verses=32, @bkId=105000000
EXEC add_Chapter @id=105013000, @code='deut-13', @ref='Deut 13', @ch=13, @verses=18, @bkId=105000000
EXEC add_Chapter @id=105014000, @code='deut-14', @ref='Deut 14', @ch=14, @verses=29, @bkId=105000000
EXEC add_Chapter @id=105015000, @code='deut-15', @ref='Deut 15', @ch=15, @verses=23, @bkId=105000000
EXEC add_Chapter @id=105016000, @code='deut-16', @ref='Deut 16', @ch=16, @verses=22, @bkId=105000000
EXEC add_Chapter @id=105017000, @code='deut-17', @ref='Deut 17', @ch=17, @verses=20, @bkId=105000000
EXEC add_Chapter @id=105018000, @code='deut-18', @ref='Deut 18', @ch=18, @verses=22, @bkId=105000000
EXEC add_Chapter @id=105019000, @code='deut-19', @ref='Deut 19', @ch=19, @verses=21, @bkId=105000000
EXEC add_Chapter @id=105020000, @code='deut-20', @ref='Deut 20', @ch=20, @verses=20, @bkId=105000000
EXEC add_Chapter @id=105021000, @code='deut-21', @ref='Deut 21', @ch=21, @verses=23, @bkId=105000000
EXEC add_Chapter @id=105022000, @code='deut-22', @ref='Deut 22', @ch=22, @verses=30, @bkId=105000000
EXEC add_Chapter @id=105023000, @code='deut-23', @ref='Deut 23', @ch=23, @verses=25, @bkId=105000000
EXEC add_Chapter @id=105024000, @code='deut-24', @ref='Deut 24', @ch=24, @verses=22, @bkId=105000000
EXEC add_Chapter @id=105025000, @code='deut-25', @ref='Deut 25', @ch=25, @verses=19, @bkId=105000000
EXEC add_Chapter @id=105026000, @code='deut-26', @ref='Deut 26', @ch=26, @verses=19, @bkId=105000000
EXEC add_Chapter @id=105027000, @code='deut-27', @ref='Deut 27', @ch=27, @verses=26, @bkId=105000000
EXEC add_Chapter @id=105028000, @code='deut-28', @ref='Deut 28', @ch=28, @verses=68, @bkId=105000000
EXEC add_Chapter @id=105029000, @code='deut-29', @ref='Deut 29', @ch=29, @verses=29, @bkId=105000000
EXEC add_Chapter @id=105030000, @code='deut-30', @ref='Deut 30', @ch=30, @verses=20, @bkId=105000000
EXEC add_Chapter @id=105031000, @code='deut-31', @ref='Deut 31', @ch=31, @verses=30, @bkId=105000000
EXEC add_Chapter @id=105032000, @code='deut-32', @ref='Deut 32', @ch=32, @verses=52, @bkId=105000000
EXEC add_Chapter @id=105033000, @code='deut-33', @ref='Deut 33', @ch=33, @verses=29, @bkId=105000000
EXEC add_Chapter @id=105034000, @code='deut-34', @ref='Deut 34', @ch=34, @verses=12, @bkId=105000000, @bkEnd=1
EXEC add_Chapter @id=106001000, @code='josh-1', @ref='Josh 1', @ch=1, @verses=18, @bkId=106000000
EXEC add_Chapter @id=106002000, @code='josh-2', @ref='Josh 2', @ch=2, @verses=24, @bkId=106000000
EXEC add_Chapter @id=106003000, @code='josh-3', @ref='Josh 3', @ch=3, @verses=17, @bkId=106000000
EXEC add_Chapter @id=106004000, @code='josh-4', @ref='Josh 4', @ch=4, @verses=24, @bkId=106000000
EXEC add_Chapter @id=106005000, @code='josh-5', @ref='Josh 5', @ch=5, @verses=15, @bkId=106000000
EXEC add_Chapter @id=106006000, @code='josh-6', @ref='Josh 6', @ch=6, @verses=27, @bkId=106000000
EXEC add_Chapter @id=106007000, @code='josh-7', @ref='Josh 7', @ch=7, @verses=26, @bkId=106000000
EXEC add_Chapter @id=106008000, @code='josh-8', @ref='Josh 8', @ch=8, @verses=35, @bkId=106000000
EXEC add_Chapter @id=106009000, @code='josh-9', @ref='Josh 9', @ch=9, @verses=27, @bkId=106000000
EXEC add_Chapter @id=106010000, @code='josh-10', @ref='Josh 10', @ch=10, @verses=43, @bkId=106000000
EXEC add_Chapter @id=106011000, @code='josh-11', @ref='Josh 11', @ch=11, @verses=23, @bkId=106000000
EXEC add_Chapter @id=106012000, @code='josh-12', @ref='Josh 12', @ch=12, @verses=24, @bkId=106000000
EXEC add_Chapter @id=106013000, @code='josh-13', @ref='Josh 13', @ch=13, @verses=33, @bkId=106000000
EXEC add_Chapter @id=106014000, @code='josh-14', @ref='Josh 14', @ch=14, @verses=15, @bkId=106000000
EXEC add_Chapter @id=106015000, @code='josh-15', @ref='Josh 15', @ch=15, @verses=63, @bkId=106000000
EXEC add_Chapter @id=106016000, @code='josh-16', @ref='Josh 16', @ch=16, @verses=10, @bkId=106000000
EXEC add_Chapter @id=106017000, @code='josh-17', @ref='Josh 17', @ch=17, @verses=18, @bkId=106000000
EXEC add_Chapter @id=106018000, @code='josh-18', @ref='Josh 18', @ch=18, @verses=28, @bkId=106000000
EXEC add_Chapter @id=106019000, @code='josh-19', @ref='Josh 19', @ch=19, @verses=51, @bkId=106000000
EXEC add_Chapter @id=106020000, @code='josh-20', @ref='Josh 20', @ch=20, @verses=9, @bkId=106000000
EXEC add_Chapter @id=106021000, @code='josh-21', @ref='Josh 21', @ch=21, @verses=45, @bkId=106000000
EXEC add_Chapter @id=106022000, @code='josh-22', @ref='Josh 22', @ch=22, @verses=34, @bkId=106000000
EXEC add_Chapter @id=106023000, @code='josh-23', @ref='Josh 23', @ch=23, @verses=16, @bkId=106000000
EXEC add_Chapter @id=106024000, @code='josh-24', @ref='Josh 24', @ch=24, @verses=33, @bkId=106000000, @bkEnd=1
EXEC add_Chapter @id=107001000, @code='judg-1', @ref='Judg 1', @ch=1, @verses=36, @bkId=107000000
EXEC add_Chapter @id=107002000, @code='judg-2', @ref='Judg 2', @ch=2, @verses=23, @bkId=107000000
EXEC add_Chapter @id=107003000, @code='judg-3', @ref='Judg 3', @ch=3, @verses=31, @bkId=107000000
EXEC add_Chapter @id=107004000, @code='judg-4', @ref='Judg 4', @ch=4, @verses=24, @bkId=107000000
EXEC add_Chapter @id=107005000, @code='judg-5', @ref='Judg 5', @ch=5, @verses=31, @bkId=107000000
EXEC add_Chapter @id=107006000, @code='judg-6', @ref='Judg 6', @ch=6, @verses=40, @bkId=107000000
EXEC add_Chapter @id=107007000, @code='judg-7', @ref='Judg 7', @ch=7, @verses=25, @bkId=107000000
EXEC add_Chapter @id=107008000, @code='judg-8', @ref='Judg 8', @ch=8, @verses=35, @bkId=107000000
EXEC add_Chapter @id=107009000, @code='judg-9', @ref='Judg 9', @ch=9, @verses=57, @bkId=107000000
EXEC add_Chapter @id=107010000, @code='judg-10', @ref='Judg 10', @ch=10, @verses=18, @bkId=107000000
EXEC add_Chapter @id=107011000, @code='judg-11', @ref='Judg 11', @ch=11, @verses=40, @bkId=107000000
EXEC add_Chapter @id=107012000, @code='judg-12', @ref='Judg 12', @ch=12, @verses=15, @bkId=107000000
EXEC add_Chapter @id=107013000, @code='judg-13', @ref='Judg 13', @ch=13, @verses=25, @bkId=107000000
EXEC add_Chapter @id=107014000, @code='judg-14', @ref='Judg 14', @ch=14, @verses=20, @bkId=107000000
EXEC add_Chapter @id=107015000, @code='judg-15', @ref='Judg 15', @ch=15, @verses=20, @bkId=107000000
EXEC add_Chapter @id=107016000, @code='judg-16', @ref='Judg 16', @ch=16, @verses=31, @bkId=107000000
EXEC add_Chapter @id=107017000, @code='judg-17', @ref='Judg 17', @ch=17, @verses=13, @bkId=107000000
EXEC add_Chapter @id=107018000, @code='judg-18', @ref='Judg 18', @ch=18, @verses=31, @bkId=107000000
EXEC add_Chapter @id=107019000, @code='judg-19', @ref='Judg 19', @ch=19, @verses=30, @bkId=107000000
EXEC add_Chapter @id=107020000, @code='judg-20', @ref='Judg 20', @ch=20, @verses=48, @bkId=107000000
EXEC add_Chapter @id=107021000, @code='judg-21', @ref='Judg 21', @ch=21, @verses=25, @bkId=107000000, @bkEnd=1
EXEC add_Chapter @id=108001000, @code='ruth-1', @ref='Ruth 1', @ch=1, @verses=22, @bkId=108000000
EXEC add_Chapter @id=108002000, @code='ruth-2', @ref='Ruth 2', @ch=2, @verses=23, @bkId=108000000
EXEC add_Chapter @id=108003000, @code='ruth-3', @ref='Ruth 3', @ch=3, @verses=18, @bkId=108000000
EXEC add_Chapter @id=108004000, @code='ruth-4', @ref='Ruth 4', @ch=4, @verses=22, @bkId=108000000, @bkEnd=1
EXEC add_Chapter @id=109001000, @code='1sa-1', @ref='1Sa 1', @ch=1, @verses=28, @bkId=109000000
EXEC add_Chapter @id=109002000, @code='1sa-2', @ref='1Sa 2', @ch=2, @verses=36, @bkId=109000000
EXEC add_Chapter @id=109003000, @code='1sa-3', @ref='1Sa 3', @ch=3, @verses=21, @bkId=109000000
EXEC add_Chapter @id=109004000, @code='1sa-4', @ref='1Sa 4', @ch=4, @verses=22, @bkId=109000000
EXEC add_Chapter @id=109005000, @code='1sa-5', @ref='1Sa 5', @ch=5, @verses=12, @bkId=109000000
EXEC add_Chapter @id=109006000, @code='1sa-6', @ref='1Sa 6', @ch=6, @verses=21, @bkId=109000000
EXEC add_Chapter @id=109007000, @code='1sa-7', @ref='1Sa 7', @ch=7, @verses=17, @bkId=109000000
EXEC add_Chapter @id=109008000, @code='1sa-8', @ref='1Sa 8', @ch=8, @verses=22, @bkId=109000000
EXEC add_Chapter @id=109009000, @code='1sa-9', @ref='1Sa 9', @ch=9, @verses=27, @bkId=109000000
EXEC add_Chapter @id=109010000, @code='1sa-10', @ref='1Sa 10', @ch=10, @verses=27, @bkId=109000000
EXEC add_Chapter @id=109011000, @code='1sa-11', @ref='1Sa 11', @ch=11, @verses=15, @bkId=109000000
EXEC add_Chapter @id=109012000, @code='1sa-12', @ref='1Sa 12', @ch=12, @verses=25, @bkId=109000000
EXEC add_Chapter @id=109013000, @code='1sa-13', @ref='1Sa 13', @ch=13, @verses=23, @bkId=109000000
EXEC add_Chapter @id=109014000, @code='1sa-14', @ref='1Sa 14', @ch=14, @verses=52, @bkId=109000000
EXEC add_Chapter @id=109015000, @code='1sa-15', @ref='1Sa 15', @ch=15, @verses=35, @bkId=109000000
EXEC add_Chapter @id=109016000, @code='1sa-16', @ref='1Sa 16', @ch=16, @verses=23, @bkId=109000000
EXEC add_Chapter @id=109017000, @code='1sa-17', @ref='1Sa 17', @ch=17, @verses=58, @bkId=109000000
EXEC add_Chapter @id=109018000, @code='1sa-18', @ref='1Sa 18', @ch=18, @verses=30, @bkId=109000000
EXEC add_Chapter @id=109019000, @code='1sa-19', @ref='1Sa 19', @ch=19, @verses=24, @bkId=109000000
EXEC add_Chapter @id=109020000, @code='1sa-20', @ref='1Sa 20', @ch=20, @verses=42, @bkId=109000000
EXEC add_Chapter @id=109021000, @code='1sa-21', @ref='1Sa 21', @ch=21, @verses=15, @bkId=109000000
EXEC add_Chapter @id=109022000, @code='1sa-22', @ref='1Sa 22', @ch=22, @verses=23, @bkId=109000000
EXEC add_Chapter @id=109023000, @code='1sa-23', @ref='1Sa 23', @ch=23, @verses=29, @bkId=109000000
EXEC add_Chapter @id=109024000, @code='1sa-24', @ref='1Sa 24', @ch=24, @verses=22, @bkId=109000000
EXEC add_Chapter @id=109025000, @code='1sa-25', @ref='1Sa 25', @ch=25, @verses=44, @bkId=109000000
EXEC add_Chapter @id=109026000, @code='1sa-26', @ref='1Sa 26', @ch=26, @verses=25, @bkId=109000000
EXEC add_Chapter @id=109027000, @code='1sa-27', @ref='1Sa 27', @ch=27, @verses=12, @bkId=109000000
EXEC add_Chapter @id=109028000, @code='1sa-28', @ref='1Sa 28', @ch=28, @verses=25, @bkId=109000000
EXEC add_Chapter @id=109029000, @code='1sa-29', @ref='1Sa 29', @ch=29, @verses=11, @bkId=109000000
EXEC add_Chapter @id=109030000, @code='1sa-30', @ref='1Sa 30', @ch=30, @verses=31, @bkId=109000000
EXEC add_Chapter @id=109031000, @code='1sa-31', @ref='1Sa 31', @ch=31, @verses=13, @bkId=109000000, @bkEnd=1
EXEC add_Chapter @id=110001000, @code='2sa-1', @ref='2Sa 1', @ch=1, @verses=27, @bkId=110000000
EXEC add_Chapter @id=110002000, @code='2sa-2', @ref='2Sa 2', @ch=2, @verses=32, @bkId=110000000
EXEC add_Chapter @id=110003000, @code='2sa-3', @ref='2Sa 3', @ch=3, @verses=39, @bkId=110000000
EXEC add_Chapter @id=110004000, @code='2sa-4', @ref='2Sa 4', @ch=4, @verses=12, @bkId=110000000
EXEC add_Chapter @id=110005000, @code='2sa-5', @ref='2Sa 5', @ch=5, @verses=25, @bkId=110000000
EXEC add_Chapter @id=110006000, @code='2sa-6', @ref='2Sa 6', @ch=6, @verses=23, @bkId=110000000
EXEC add_Chapter @id=110007000, @code='2sa-7', @ref='2Sa 7', @ch=7, @verses=29, @bkId=110000000
EXEC add_Chapter @id=110008000, @code='2sa-8', @ref='2Sa 8', @ch=8, @verses=18, @bkId=110000000
EXEC add_Chapter @id=110009000, @code='2sa-9', @ref='2Sa 9', @ch=9, @verses=13, @bkId=110000000
EXEC add_Chapter @id=110010000, @code='2sa-10', @ref='2Sa 10', @ch=10, @verses=19, @bkId=110000000
EXEC add_Chapter @id=110011000, @code='2sa-11', @ref='2Sa 11', @ch=11, @verses=27, @bkId=110000000
EXEC add_Chapter @id=110012000, @code='2sa-12', @ref='2Sa 12', @ch=12, @verses=31, @bkId=110000000
EXEC add_Chapter @id=110013000, @code='2sa-13', @ref='2Sa 13', @ch=13, @verses=39, @bkId=110000000
EXEC add_Chapter @id=110014000, @code='2sa-14', @ref='2Sa 14', @ch=14, @verses=33, @bkId=110000000
EXEC add_Chapter @id=110015000, @code='2sa-15', @ref='2Sa 15', @ch=15, @verses=37, @bkId=110000000
EXEC add_Chapter @id=110016000, @code='2sa-16', @ref='2Sa 16', @ch=16, @verses=23, @bkId=110000000
EXEC add_Chapter @id=110017000, @code='2sa-17', @ref='2Sa 17', @ch=17, @verses=29, @bkId=110000000
EXEC add_Chapter @id=110018000, @code='2sa-18', @ref='2Sa 18', @ch=18, @verses=33, @bkId=110000000
EXEC add_Chapter @id=110019000, @code='2sa-19', @ref='2Sa 19', @ch=19, @verses=43, @bkId=110000000
EXEC add_Chapter @id=110020000, @code='2sa-20', @ref='2Sa 20', @ch=20, @verses=26, @bkId=110000000
EXEC add_Chapter @id=110021000, @code='2sa-21', @ref='2Sa 21', @ch=21, @verses=22, @bkId=110000000
EXEC add_Chapter @id=110022000, @code='2sa-22', @ref='2Sa 22', @ch=22, @verses=51, @bkId=110000000
EXEC add_Chapter @id=110023000, @code='2sa-23', @ref='2Sa 23', @ch=23, @verses=39, @bkId=110000000
EXEC add_Chapter @id=110024000, @code='2sa-24', @ref='2Sa 24', @ch=24, @verses=25, @bkId=110000000, @bkEnd=1
EXEC add_Chapter @id=111001000, @code='1ki-1', @ref='1Ki 1', @ch=1, @verses=53, @bkId=111000000
EXEC add_Chapter @id=111002000, @code='1ki-2', @ref='1Ki 2', @ch=2, @verses=46, @bkId=111000000
EXEC add_Chapter @id=111003000, @code='1ki-3', @ref='1Ki 3', @ch=3, @verses=28, @bkId=111000000
EXEC add_Chapter @id=111004000, @code='1ki-4', @ref='1Ki 4', @ch=4, @verses=34, @bkId=111000000
EXEC add_Chapter @id=111005000, @code='1ki-5', @ref='1Ki 5', @ch=5, @verses=18, @bkId=111000000
EXEC add_Chapter @id=111006000, @code='1ki-6', @ref='1Ki 6', @ch=6, @verses=38, @bkId=111000000
EXEC add_Chapter @id=111007000, @code='1ki-7', @ref='1Ki 7', @ch=7, @verses=51, @bkId=111000000
EXEC add_Chapter @id=111008000, @code='1ki-8', @ref='1Ki 8', @ch=8, @verses=66, @bkId=111000000
EXEC add_Chapter @id=111009000, @code='1ki-9', @ref='1Ki 9', @ch=9, @verses=28, @bkId=111000000
EXEC add_Chapter @id=111010000, @code='1ki-10', @ref='1Ki 10', @ch=10, @verses=29, @bkId=111000000
EXEC add_Chapter @id=111011000, @code='1ki-11', @ref='1Ki 11', @ch=11, @verses=43, @bkId=111000000
EXEC add_Chapter @id=111012000, @code='1ki-12', @ref='1Ki 12', @ch=12, @verses=33, @bkId=111000000
EXEC add_Chapter @id=111013000, @code='1ki-13', @ref='1Ki 13', @ch=13, @verses=34, @bkId=111000000
EXEC add_Chapter @id=111014000, @code='1ki-14', @ref='1Ki 14', @ch=14, @verses=31, @bkId=111000000
EXEC add_Chapter @id=111015000, @code='1ki-15', @ref='1Ki 15', @ch=15, @verses=34, @bkId=111000000
EXEC add_Chapter @id=111016000, @code='1ki-16', @ref='1Ki 16', @ch=16, @verses=34, @bkId=111000000
EXEC add_Chapter @id=111017000, @code='1ki-17', @ref='1Ki 17', @ch=17, @verses=24, @bkId=111000000
EXEC add_Chapter @id=111018000, @code='1ki-18', @ref='1Ki 18', @ch=18, @verses=46, @bkId=111000000
EXEC add_Chapter @id=111019000, @code='1ki-19', @ref='1Ki 19', @ch=19, @verses=21, @bkId=111000000
EXEC add_Chapter @id=111020000, @code='1ki-20', @ref='1Ki 20', @ch=20, @verses=43, @bkId=111000000
EXEC add_Chapter @id=111021000, @code='1ki-21', @ref='1Ki 21', @ch=21, @verses=29, @bkId=111000000
EXEC add_Chapter @id=111022000, @code='1ki-22', @ref='1Ki 22', @ch=22, @verses=53, @bkId=111000000, @bkEnd=1
EXEC add_Chapter @id=112001000, @code='2ki-1', @ref='2Ki 1', @ch=1, @verses=18, @bkId=112000000
EXEC add_Chapter @id=112002000, @code='2ki-2', @ref='2Ki 2', @ch=2, @verses=25, @bkId=112000000
EXEC add_Chapter @id=112003000, @code='2ki-3', @ref='2Ki 3', @ch=3, @verses=27, @bkId=112000000
EXEC add_Chapter @id=112004000, @code='2ki-4', @ref='2Ki 4', @ch=4, @verses=44, @bkId=112000000
EXEC add_Chapter @id=112005000, @code='2ki-5', @ref='2Ki 5', @ch=5, @verses=27, @bkId=112000000
EXEC add_Chapter @id=112006000, @code='2ki-6', @ref='2Ki 6', @ch=6, @verses=33, @bkId=112000000
EXEC add_Chapter @id=112007000, @code='2ki-7', @ref='2Ki 7', @ch=7, @verses=20, @bkId=112000000
EXEC add_Chapter @id=112008000, @code='2ki-8', @ref='2Ki 8', @ch=8, @verses=29, @bkId=112000000
EXEC add_Chapter @id=112009000, @code='2ki-9', @ref='2Ki 9', @ch=9, @verses=37, @bkId=112000000
EXEC add_Chapter @id=112010000, @code='2ki-10', @ref='2Ki 10', @ch=10, @verses=36, @bkId=112000000
EXEC add_Chapter @id=112011000, @code='2ki-11', @ref='2Ki 11', @ch=11, @verses=21, @bkId=112000000
EXEC add_Chapter @id=112012000, @code='2ki-12', @ref='2Ki 12', @ch=12, @verses=21, @bkId=112000000
EXEC add_Chapter @id=112013000, @code='2ki-13', @ref='2Ki 13', @ch=13, @verses=25, @bkId=112000000
EXEC add_Chapter @id=112014000, @code='2ki-14', @ref='2Ki 14', @ch=14, @verses=29, @bkId=112000000
EXEC add_Chapter @id=112015000, @code='2ki-15', @ref='2Ki 15', @ch=15, @verses=38, @bkId=112000000
EXEC add_Chapter @id=112016000, @code='2ki-16', @ref='2Ki 16', @ch=16, @verses=20, @bkId=112000000
EXEC add_Chapter @id=112017000, @code='2ki-17', @ref='2Ki 17', @ch=17, @verses=41, @bkId=112000000
EXEC add_Chapter @id=112018000, @code='2ki-18', @ref='2Ki 18', @ch=18, @verses=37, @bkId=112000000
EXEC add_Chapter @id=112019000, @code='2ki-19', @ref='2Ki 19', @ch=19, @verses=37, @bkId=112000000
EXEC add_Chapter @id=112020000, @code='2ki-20', @ref='2Ki 20', @ch=20, @verses=21, @bkId=112000000
EXEC add_Chapter @id=112021000, @code='2ki-21', @ref='2Ki 21', @ch=21, @verses=26, @bkId=112000000
EXEC add_Chapter @id=112022000, @code='2ki-22', @ref='2Ki 22', @ch=22, @verses=20, @bkId=112000000
EXEC add_Chapter @id=112023000, @code='2ki-23', @ref='2Ki 23', @ch=23, @verses=37, @bkId=112000000
EXEC add_Chapter @id=112024000, @code='2ki-24', @ref='2Ki 24', @ch=24, @verses=20, @bkId=112000000
EXEC add_Chapter @id=112025000, @code='2ki-25', @ref='2Ki 25', @ch=25, @verses=30, @bkId=112000000, @bkEnd=1
EXEC add_Chapter @id=113001000, @code='1ch-1', @ref='1Ch 1', @ch=1, @verses=54, @bkId=113000000
EXEC add_Chapter @id=113002000, @code='1ch-2', @ref='1Ch 2', @ch=2, @verses=55, @bkId=113000000
EXEC add_Chapter @id=113003000, @code='1ch-3', @ref='1Ch 3', @ch=3, @verses=24, @bkId=113000000
EXEC add_Chapter @id=113004000, @code='1ch-4', @ref='1Ch 4', @ch=4, @verses=43, @bkId=113000000
EXEC add_Chapter @id=113005000, @code='1ch-5', @ref='1Ch 5', @ch=5, @verses=26, @bkId=113000000
EXEC add_Chapter @id=113006000, @code='1ch-6', @ref='1Ch 6', @ch=6, @verses=81, @bkId=113000000
EXEC add_Chapter @id=113007000, @code='1ch-7', @ref='1Ch 7', @ch=7, @verses=40, @bkId=113000000
EXEC add_Chapter @id=113008000, @code='1ch-8', @ref='1Ch 8', @ch=8, @verses=40, @bkId=113000000
EXEC add_Chapter @id=113009000, @code='1ch-9', @ref='1Ch 9', @ch=9, @verses=44, @bkId=113000000
EXEC add_Chapter @id=113010000, @code='1ch-10', @ref='1Ch 10', @ch=10, @verses=14, @bkId=113000000
EXEC add_Chapter @id=113011000, @code='1ch-11', @ref='1Ch 11', @ch=11, @verses=47, @bkId=113000000
EXEC add_Chapter @id=113012000, @code='1ch-12', @ref='1Ch 12', @ch=12, @verses=40, @bkId=113000000
EXEC add_Chapter @id=113013000, @code='1ch-13', @ref='1Ch 13', @ch=13, @verses=14, @bkId=113000000
EXEC add_Chapter @id=113014000, @code='1ch-14', @ref='1Ch 14', @ch=14, @verses=17, @bkId=113000000
EXEC add_Chapter @id=113015000, @code='1ch-15', @ref='1Ch 15', @ch=15, @verses=29, @bkId=113000000
EXEC add_Chapter @id=113016000, @code='1ch-16', @ref='1Ch 16', @ch=16, @verses=43, @bkId=113000000
EXEC add_Chapter @id=113017000, @code='1ch-17', @ref='1Ch 17', @ch=17, @verses=27, @bkId=113000000
EXEC add_Chapter @id=113018000, @code='1ch-18', @ref='1Ch 18', @ch=18, @verses=17, @bkId=113000000
EXEC add_Chapter @id=113019000, @code='1ch-19', @ref='1Ch 19', @ch=19, @verses=19, @bkId=113000000
EXEC add_Chapter @id=113020000, @code='1ch-20', @ref='1Ch 20', @ch=20, @verses=8, @bkId=113000000
EXEC add_Chapter @id=113021000, @code='1ch-21', @ref='1Ch 21', @ch=21, @verses=30, @bkId=113000000
EXEC add_Chapter @id=113022000, @code='1ch-22', @ref='1Ch 22', @ch=22, @verses=19, @bkId=113000000
EXEC add_Chapter @id=113023000, @code='1ch-23', @ref='1Ch 23', @ch=23, @verses=32, @bkId=113000000
EXEC add_Chapter @id=113024000, @code='1ch-24', @ref='1Ch 24', @ch=24, @verses=31, @bkId=113000000
EXEC add_Chapter @id=113025000, @code='1ch-25', @ref='1Ch 25', @ch=25, @verses=31, @bkId=113000000
EXEC add_Chapter @id=113026000, @code='1ch-26', @ref='1Ch 26', @ch=26, @verses=32, @bkId=113000000
EXEC add_Chapter @id=113027000, @code='1ch-27', @ref='1Ch 27', @ch=27, @verses=34, @bkId=113000000
EXEC add_Chapter @id=113028000, @code='1ch-28', @ref='1Ch 28', @ch=28, @verses=21, @bkId=113000000
EXEC add_Chapter @id=113029000, @code='1ch-29', @ref='1Ch 29', @ch=29, @verses=30, @bkId=113000000, @bkEnd=1
EXEC add_Chapter @id=114001000, @code='2ch-1', @ref='2Ch 1', @ch=1, @verses=17, @bkId=114000000
EXEC add_Chapter @id=114002000, @code='2ch-2', @ref='2Ch 2', @ch=2, @verses=18, @bkId=114000000
EXEC add_Chapter @id=114003000, @code='2ch-3', @ref='2Ch 3', @ch=3, @verses=17, @bkId=114000000
EXEC add_Chapter @id=114004000, @code='2ch-4', @ref='2Ch 4', @ch=4, @verses=22, @bkId=114000000
EXEC add_Chapter @id=114005000, @code='2ch-5', @ref='2Ch 5', @ch=5, @verses=14, @bkId=114000000
EXEC add_Chapter @id=114006000, @code='2ch-6', @ref='2Ch 6', @ch=6, @verses=42, @bkId=114000000
EXEC add_Chapter @id=114007000, @code='2ch-7', @ref='2Ch 7', @ch=7, @verses=22, @bkId=114000000
EXEC add_Chapter @id=114008000, @code='2ch-8', @ref='2Ch 8', @ch=8, @verses=18, @bkId=114000000
EXEC add_Chapter @id=114009000, @code='2ch-9', @ref='2Ch 9', @ch=9, @verses=31, @bkId=114000000
EXEC add_Chapter @id=114010000, @code='2ch-10', @ref='2Ch 10', @ch=10, @verses=19, @bkId=114000000
EXEC add_Chapter @id=114011000, @code='2ch-11', @ref='2Ch 11', @ch=11, @verses=23, @bkId=114000000
EXEC add_Chapter @id=114012000, @code='2ch-12', @ref='2Ch 12', @ch=12, @verses=16, @bkId=114000000
EXEC add_Chapter @id=114013000, @code='2ch-13', @ref='2Ch 13', @ch=13, @verses=22, @bkId=114000000
EXEC add_Chapter @id=114014000, @code='2ch-14', @ref='2Ch 14', @ch=14, @verses=15, @bkId=114000000
EXEC add_Chapter @id=114015000, @code='2ch-15', @ref='2Ch 15', @ch=15, @verses=19, @bkId=114000000
EXEC add_Chapter @id=114016000, @code='2ch-16', @ref='2Ch 16', @ch=16, @verses=14, @bkId=114000000
EXEC add_Chapter @id=114017000, @code='2ch-17', @ref='2Ch 17', @ch=17, @verses=19, @bkId=114000000
EXEC add_Chapter @id=114018000, @code='2ch-18', @ref='2Ch 18', @ch=18, @verses=34, @bkId=114000000
EXEC add_Chapter @id=114019000, @code='2ch-19', @ref='2Ch 19', @ch=19, @verses=11, @bkId=114000000
EXEC add_Chapter @id=114020000, @code='2ch-20', @ref='2Ch 20', @ch=20, @verses=37, @bkId=114000000
EXEC add_Chapter @id=114021000, @code='2ch-21', @ref='2Ch 21', @ch=21, @verses=20, @bkId=114000000
EXEC add_Chapter @id=114022000, @code='2ch-22', @ref='2Ch 22', @ch=22, @verses=12, @bkId=114000000
EXEC add_Chapter @id=114023000, @code='2ch-23', @ref='2Ch 23', @ch=23, @verses=21, @bkId=114000000
EXEC add_Chapter @id=114024000, @code='2ch-24', @ref='2Ch 24', @ch=24, @verses=27, @bkId=114000000
EXEC add_Chapter @id=114025000, @code='2ch-25', @ref='2Ch 25', @ch=25, @verses=28, @bkId=114000000
EXEC add_Chapter @id=114026000, @code='2ch-26', @ref='2Ch 26', @ch=26, @verses=23, @bkId=114000000
EXEC add_Chapter @id=114027000, @code='2ch-27', @ref='2Ch 27', @ch=27, @verses=9, @bkId=114000000
EXEC add_Chapter @id=114028000, @code='2ch-28', @ref='2Ch 28', @ch=28, @verses=27, @bkId=114000000
EXEC add_Chapter @id=114029000, @code='2ch-29', @ref='2Ch 29', @ch=29, @verses=36, @bkId=114000000
EXEC add_Chapter @id=114030000, @code='2ch-30', @ref='2Ch 30', @ch=30, @verses=27, @bkId=114000000
EXEC add_Chapter @id=114031000, @code='2ch-31', @ref='2Ch 31', @ch=31, @verses=21, @bkId=114000000
EXEC add_Chapter @id=114032000, @code='2ch-32', @ref='2Ch 32', @ch=32, @verses=33, @bkId=114000000
EXEC add_Chapter @id=114033000, @code='2ch-33', @ref='2Ch 33', @ch=33, @verses=25, @bkId=114000000
EXEC add_Chapter @id=114034000, @code='2ch-34', @ref='2Ch 34', @ch=34, @verses=33, @bkId=114000000
EXEC add_Chapter @id=114035000, @code='2ch-35', @ref='2Ch 35', @ch=35, @verses=27, @bkId=114000000
EXEC add_Chapter @id=114036000, @code='2ch-36', @ref='2Ch 36', @ch=36, @verses=23, @bkId=114000000, @bkEnd=1
EXEC add_Chapter @id=115001000, @code='ezra-1', @ref='Ezra 1', @ch=1, @verses=11, @bkId=115000000
EXEC add_Chapter @id=115002000, @code='ezra-2', @ref='Ezra 2', @ch=2, @verses=70, @bkId=115000000
EXEC add_Chapter @id=115003000, @code='ezra-3', @ref='Ezra 3', @ch=3, @verses=13, @bkId=115000000
EXEC add_Chapter @id=115004000, @code='ezra-4', @ref='Ezra 4', @ch=4, @verses=24, @bkId=115000000
EXEC add_Chapter @id=115005000, @code='ezra-5', @ref='Ezra 5', @ch=5, @verses=17, @bkId=115000000
EXEC add_Chapter @id=115006000, @code='ezra-6', @ref='Ezra 6', @ch=6, @verses=22, @bkId=115000000
EXEC add_Chapter @id=115007000, @code='ezra-7', @ref='Ezra 7', @ch=7, @verses=28, @bkId=115000000
EXEC add_Chapter @id=115008000, @code='ezra-8', @ref='Ezra 8', @ch=8, @verses=36, @bkId=115000000
EXEC add_Chapter @id=115009000, @code='ezra-9', @ref='Ezra 9', @ch=9, @verses=15, @bkId=115000000
EXEC add_Chapter @id=115010000, @code='ezra-10', @ref='Ezra 10', @ch=10, @verses=44, @bkId=115000000, @bkEnd=1
EXEC add_Chapter @id=116001000, @code='neh-1', @ref='Neh 1', @ch=1, @verses=11, @bkId=116000000
EXEC add_Chapter @id=116002000, @code='neh-2', @ref='Neh 2', @ch=2, @verses=20, @bkId=116000000
EXEC add_Chapter @id=116003000, @code='neh-3', @ref='Neh 3', @ch=3, @verses=32, @bkId=116000000
EXEC add_Chapter @id=116004000, @code='neh-4', @ref='Neh 4', @ch=4, @verses=23, @bkId=116000000
EXEC add_Chapter @id=116005000, @code='neh-5', @ref='Neh 5', @ch=5, @verses=19, @bkId=116000000
EXEC add_Chapter @id=116006000, @code='neh-6', @ref='Neh 6', @ch=6, @verses=19, @bkId=116000000
EXEC add_Chapter @id=116007000, @code='neh-7', @ref='Neh 7', @ch=7, @verses=73, @bkId=116000000
EXEC add_Chapter @id=116008000, @code='neh-8', @ref='Neh 8', @ch=8, @verses=18, @bkId=116000000
EXEC add_Chapter @id=116009000, @code='neh-9', @ref='Neh 9', @ch=9, @verses=38, @bkId=116000000
EXEC add_Chapter @id=116010000, @code='neh-10', @ref='Neh 10', @ch=10, @verses=39, @bkId=116000000
EXEC add_Chapter @id=116011000, @code='neh-11', @ref='Neh 11', @ch=11, @verses=36, @bkId=116000000
EXEC add_Chapter @id=116012000, @code='neh-12', @ref='Neh 12', @ch=12, @verses=47, @bkId=116000000
EXEC add_Chapter @id=116013000, @code='neh-13', @ref='Neh 13', @ch=13, @verses=31, @bkId=116000000, @bkEnd=1
EXEC add_Chapter @id=117001000, @code='est-1', @ref='Est 1', @ch=1, @verses=22, @bkId=117000000
EXEC add_Chapter @id=117002000, @code='est-2', @ref='Est 2', @ch=2, @verses=23, @bkId=117000000
EXEC add_Chapter @id=117003000, @code='est-3', @ref='Est 3', @ch=3, @verses=15, @bkId=117000000
EXEC add_Chapter @id=117004000, @code='est-4', @ref='Est 4', @ch=4, @verses=17, @bkId=117000000
EXEC add_Chapter @id=117005000, @code='est-5', @ref='Est 5', @ch=5, @verses=14, @bkId=117000000
EXEC add_Chapter @id=117006000, @code='est-6', @ref='Est 6', @ch=6, @verses=14, @bkId=117000000
EXEC add_Chapter @id=117007000, @code='est-7', @ref='Est 7', @ch=7, @verses=10, @bkId=117000000
EXEC add_Chapter @id=117008000, @code='est-8', @ref='Est 8', @ch=8, @verses=17, @bkId=117000000
EXEC add_Chapter @id=117009000, @code='est-9', @ref='Est 9', @ch=9, @verses=32, @bkId=117000000
EXEC add_Chapter @id=117010000, @code='est-10', @ref='Est 10', @ch=10, @verses=3, @bkId=117000000, @bkEnd=1
EXEC add_Chapter @id=118001000, @code='job-1', @ref='Job 1', @ch=1, @verses=22, @bkId=118000000
EXEC add_Chapter @id=118002000, @code='job-2', @ref='Job 2', @ch=2, @verses=13, @bkId=118000000
EXEC add_Chapter @id=118003000, @code='job-3', @ref='Job 3', @ch=3, @verses=26, @bkId=118000000
EXEC add_Chapter @id=118004000, @code='job-4', @ref='Job 4', @ch=4, @verses=21, @bkId=118000000
EXEC add_Chapter @id=118005000, @code='job-5', @ref='Job 5', @ch=5, @verses=27, @bkId=118000000
EXEC add_Chapter @id=118006000, @code='job-6', @ref='Job 6', @ch=6, @verses=30, @bkId=118000000
EXEC add_Chapter @id=118007000, @code='job-7', @ref='Job 7', @ch=7, @verses=21, @bkId=118000000
EXEC add_Chapter @id=118008000, @code='job-8', @ref='Job 8', @ch=8, @verses=22, @bkId=118000000
EXEC add_Chapter @id=118009000, @code='job-9', @ref='Job 9', @ch=9, @verses=35, @bkId=118000000
EXEC add_Chapter @id=118010000, @code='job-10', @ref='Job 10', @ch=10, @verses=22, @bkId=118000000
EXEC add_Chapter @id=118011000, @code='job-11', @ref='Job 11', @ch=11, @verses=20, @bkId=118000000
EXEC add_Chapter @id=118012000, @code='job-12', @ref='Job 12', @ch=12, @verses=25, @bkId=118000000
EXEC add_Chapter @id=118013000, @code='job-13', @ref='Job 13', @ch=13, @verses=28, @bkId=118000000
EXEC add_Chapter @id=118014000, @code='job-14', @ref='Job 14', @ch=14, @verses=22, @bkId=118000000
EXEC add_Chapter @id=118015000, @code='job-15', @ref='Job 15', @ch=15, @verses=35, @bkId=118000000
EXEC add_Chapter @id=118016000, @code='job-16', @ref='Job 16', @ch=16, @verses=22, @bkId=118000000
EXEC add_Chapter @id=118017000, @code='job-17', @ref='Job 17', @ch=17, @verses=16, @bkId=118000000
EXEC add_Chapter @id=118018000, @code='job-18', @ref='Job 18', @ch=18, @verses=21, @bkId=118000000
EXEC add_Chapter @id=118019000, @code='job-19', @ref='Job 19', @ch=19, @verses=29, @bkId=118000000
EXEC add_Chapter @id=118020000, @code='job-20', @ref='Job 20', @ch=20, @verses=29, @bkId=118000000
EXEC add_Chapter @id=118021000, @code='job-21', @ref='Job 21', @ch=21, @verses=34, @bkId=118000000
EXEC add_Chapter @id=118022000, @code='job-22', @ref='Job 22', @ch=22, @verses=30, @bkId=118000000
EXEC add_Chapter @id=118023000, @code='job-23', @ref='Job 23', @ch=23, @verses=17, @bkId=118000000
EXEC add_Chapter @id=118024000, @code='job-24', @ref='Job 24', @ch=24, @verses=25, @bkId=118000000
EXEC add_Chapter @id=118025000, @code='job-25', @ref='Job 25', @ch=25, @verses=6, @bkId=118000000
EXEC add_Chapter @id=118026000, @code='job-26', @ref='Job 26', @ch=26, @verses=14, @bkId=118000000
EXEC add_Chapter @id=118027000, @code='job-27', @ref='Job 27', @ch=27, @verses=23, @bkId=118000000
EXEC add_Chapter @id=118028000, @code='job-28', @ref='Job 28', @ch=28, @verses=28, @bkId=118000000
EXEC add_Chapter @id=118029000, @code='job-29', @ref='Job 29', @ch=29, @verses=25, @bkId=118000000
EXEC add_Chapter @id=118030000, @code='job-30', @ref='Job 30', @ch=30, @verses=31, @bkId=118000000
EXEC add_Chapter @id=118031000, @code='job-31', @ref='Job 31', @ch=31, @verses=40, @bkId=118000000
EXEC add_Chapter @id=118032000, @code='job-32', @ref='Job 32', @ch=32, @verses=22, @bkId=118000000
EXEC add_Chapter @id=118033000, @code='job-33', @ref='Job 33', @ch=33, @verses=33, @bkId=118000000
EXEC add_Chapter @id=118034000, @code='job-34', @ref='Job 34', @ch=34, @verses=37, @bkId=118000000
EXEC add_Chapter @id=118035000, @code='job-35', @ref='Job 35', @ch=35, @verses=16, @bkId=118000000
EXEC add_Chapter @id=118036000, @code='job-36', @ref='Job 36', @ch=36, @verses=33, @bkId=118000000
EXEC add_Chapter @id=118037000, @code='job-37', @ref='Job 37', @ch=37, @verses=24, @bkId=118000000
EXEC add_Chapter @id=118038000, @code='job-38', @ref='Job 38', @ch=38, @verses=41, @bkId=118000000
EXEC add_Chapter @id=118039000, @code='job-39', @ref='Job 39', @ch=39, @verses=30, @bkId=118000000
EXEC add_Chapter @id=118040000, @code='job-40', @ref='Job 40', @ch=40, @verses=24, @bkId=118000000
EXEC add_Chapter @id=118041000, @code='job-41', @ref='Job 41', @ch=41, @verses=34, @bkId=118000000
EXEC add_Chapter @id=118042000, @code='job-42', @ref='Job 42', @ch=42, @verses=17, @bkId=118000000, @bkEnd=1
EXEC add_Chapter @id=119001000, @code='ps-1', @ref='Ps 1', @ch=1, @verses=6, @bkId=119000000
EXEC add_Chapter @id=119002000, @code='ps-2', @ref='Ps 2', @ch=2, @verses=12, @bkId=119000000
EXEC add_Chapter @id=119003000, @code='ps-3', @ref='Ps 3', @ch=3, @verses=8, @bkId=119000000
EXEC add_Chapter @id=119004000, @code='ps-4', @ref='Ps 4', @ch=4, @verses=8, @bkId=119000000
EXEC add_Chapter @id=119005000, @code='ps-5', @ref='Ps 5', @ch=5, @verses=12, @bkId=119000000
EXEC add_Chapter @id=119006000, @code='ps-6', @ref='Ps 6', @ch=6, @verses=10, @bkId=119000000
EXEC add_Chapter @id=119007000, @code='ps-7', @ref='Ps 7', @ch=7, @verses=17, @bkId=119000000
EXEC add_Chapter @id=119008000, @code='ps-8', @ref='Ps 8', @ch=8, @verses=9, @bkId=119000000
EXEC add_Chapter @id=119009000, @code='ps-9', @ref='Ps 9', @ch=9, @verses=20, @bkId=119000000
EXEC add_Chapter @id=119010000, @code='ps-10', @ref='Ps 10', @ch=10, @verses=18, @bkId=119000000
EXEC add_Chapter @id=119011000, @code='ps-11', @ref='Ps 11', @ch=11, @verses=7, @bkId=119000000
EXEC add_Chapter @id=119012000, @code='ps-12', @ref='Ps 12', @ch=12, @verses=8, @bkId=119000000
EXEC add_Chapter @id=119013000, @code='ps-13', @ref='Ps 13', @ch=13, @verses=6, @bkId=119000000
EXEC add_Chapter @id=119014000, @code='ps-14', @ref='Ps 14', @ch=14, @verses=7, @bkId=119000000
EXEC add_Chapter @id=119015000, @code='ps-15', @ref='Ps 15', @ch=15, @verses=5, @bkId=119000000
EXEC add_Chapter @id=119016000, @code='ps-16', @ref='Ps 16', @ch=16, @verses=11, @bkId=119000000
EXEC add_Chapter @id=119017000, @code='ps-17', @ref='Ps 17', @ch=17, @verses=15, @bkId=119000000
EXEC add_Chapter @id=119018000, @code='ps-18', @ref='Ps 18', @ch=18, @verses=50, @bkId=119000000
EXEC add_Chapter @id=119019000, @code='ps-19', @ref='Ps 19', @ch=19, @verses=14, @bkId=119000000
EXEC add_Chapter @id=119020000, @code='ps-20', @ref='Ps 20', @ch=20, @verses=9, @bkId=119000000
EXEC add_Chapter @id=119021000, @code='ps-21', @ref='Ps 21', @ch=21, @verses=13, @bkId=119000000
EXEC add_Chapter @id=119022000, @code='ps-22', @ref='Ps 22', @ch=22, @verses=31, @bkId=119000000
EXEC add_Chapter @id=119023000, @code='ps-23', @ref='Ps 23', @ch=23, @verses=6, @bkId=119000000
EXEC add_Chapter @id=119024000, @code='ps-24', @ref='Ps 24', @ch=24, @verses=10, @bkId=119000000
EXEC add_Chapter @id=119025000, @code='ps-25', @ref='Ps 25', @ch=25, @verses=22, @bkId=119000000
EXEC add_Chapter @id=119026000, @code='ps-26', @ref='Ps 26', @ch=26, @verses=12, @bkId=119000000
EXEC add_Chapter @id=119027000, @code='ps-27', @ref='Ps 27', @ch=27, @verses=14, @bkId=119000000
EXEC add_Chapter @id=119028000, @code='ps-28', @ref='Ps 28', @ch=28, @verses=9, @bkId=119000000
EXEC add_Chapter @id=119029000, @code='ps-29', @ref='Ps 29', @ch=29, @verses=11, @bkId=119000000
EXEC add_Chapter @id=119030000, @code='ps-30', @ref='Ps 30', @ch=30, @verses=12, @bkId=119000000
EXEC add_Chapter @id=119031000, @code='ps-31', @ref='Ps 31', @ch=31, @verses=24, @bkId=119000000
EXEC add_Chapter @id=119032000, @code='ps-32', @ref='Ps 32', @ch=32, @verses=11, @bkId=119000000
EXEC add_Chapter @id=119033000, @code='ps-33', @ref='Ps 33', @ch=33, @verses=22, @bkId=119000000
EXEC add_Chapter @id=119034000, @code='ps-34', @ref='Ps 34', @ch=34, @verses=22, @bkId=119000000
EXEC add_Chapter @id=119035000, @code='ps-35', @ref='Ps 35', @ch=35, @verses=28, @bkId=119000000
EXEC add_Chapter @id=119036000, @code='ps-36', @ref='Ps 36', @ch=36, @verses=12, @bkId=119000000
EXEC add_Chapter @id=119037000, @code='ps-37', @ref='Ps 37', @ch=37, @verses=40, @bkId=119000000
EXEC add_Chapter @id=119038000, @code='ps-38', @ref='Ps 38', @ch=38, @verses=22, @bkId=119000000
EXEC add_Chapter @id=119039000, @code='ps-39', @ref='Ps 39', @ch=39, @verses=13, @bkId=119000000
EXEC add_Chapter @id=119040000, @code='ps-40', @ref='Ps 40', @ch=40, @verses=17, @bkId=119000000
EXEC add_Chapter @id=119041000, @code='ps-41', @ref='Ps 41', @ch=41, @verses=13, @bkId=119000000
EXEC add_Chapter @id=119042000, @code='ps-42', @ref='Ps 42', @ch=42, @verses=11, @bkId=119000000
EXEC add_Chapter @id=119043000, @code='ps-43', @ref='Ps 43', @ch=43, @verses=5, @bkId=119000000
EXEC add_Chapter @id=119044000, @code='ps-44', @ref='Ps 44', @ch=44, @verses=26, @bkId=119000000
EXEC add_Chapter @id=119045000, @code='ps-45', @ref='Ps 45', @ch=45, @verses=17, @bkId=119000000
EXEC add_Chapter @id=119046000, @code='ps-46', @ref='Ps 46', @ch=46, @verses=11, @bkId=119000000
EXEC add_Chapter @id=119047000, @code='ps-47', @ref='Ps 47', @ch=47, @verses=9, @bkId=119000000
EXEC add_Chapter @id=119048000, @code='ps-48', @ref='Ps 48', @ch=48, @verses=14, @bkId=119000000
EXEC add_Chapter @id=119049000, @code='ps-49', @ref='Ps 49', @ch=49, @verses=20, @bkId=119000000
EXEC add_Chapter @id=119050000, @code='ps-50', @ref='Ps 50', @ch=50, @verses=23, @bkId=119000000
EXEC add_Chapter @id=119051000, @code='ps-51', @ref='Ps 51', @ch=51, @verses=19, @bkId=119000000
EXEC add_Chapter @id=119052000, @code='ps-52', @ref='Ps 52', @ch=52, @verses=9, @bkId=119000000
EXEC add_Chapter @id=119053000, @code='ps-53', @ref='Ps 53', @ch=53, @verses=6, @bkId=119000000
EXEC add_Chapter @id=119054000, @code='ps-54', @ref='Ps 54', @ch=54, @verses=7, @bkId=119000000
EXEC add_Chapter @id=119055000, @code='ps-55', @ref='Ps 55', @ch=55, @verses=23, @bkId=119000000
EXEC add_Chapter @id=119056000, @code='ps-56', @ref='Ps 56', @ch=56, @verses=13, @bkId=119000000
EXEC add_Chapter @id=119057000, @code='ps-57', @ref='Ps 57', @ch=57, @verses=11, @bkId=119000000
EXEC add_Chapter @id=119058000, @code='ps-58', @ref='Ps 58', @ch=58, @verses=11, @bkId=119000000
EXEC add_Chapter @id=119059000, @code='ps-59', @ref='Ps 59', @ch=59, @verses=17, @bkId=119000000
EXEC add_Chapter @id=119060000, @code='ps-60', @ref='Ps 60', @ch=60, @verses=12, @bkId=119000000
EXEC add_Chapter @id=119061000, @code='ps-61', @ref='Ps 61', @ch=61, @verses=8, @bkId=119000000
EXEC add_Chapter @id=119062000, @code='ps-62', @ref='Ps 62', @ch=62, @verses=12, @bkId=119000000
EXEC add_Chapter @id=119063000, @code='ps-63', @ref='Ps 63', @ch=63, @verses=11, @bkId=119000000
EXEC add_Chapter @id=119064000, @code='ps-64', @ref='Ps 64', @ch=64, @verses=10, @bkId=119000000
EXEC add_Chapter @id=119065000, @code='ps-65', @ref='Ps 65', @ch=65, @verses=13, @bkId=119000000
EXEC add_Chapter @id=119066000, @code='ps-66', @ref='Ps 66', @ch=66, @verses=20, @bkId=119000000
EXEC add_Chapter @id=119067000, @code='ps-67', @ref='Ps 67', @ch=67, @verses=7, @bkId=119000000
EXEC add_Chapter @id=119068000, @code='ps-68', @ref='Ps 68', @ch=68, @verses=35, @bkId=119000000
EXEC add_Chapter @id=119069000, @code='ps-69', @ref='Ps 69', @ch=69, @verses=36, @bkId=119000000
EXEC add_Chapter @id=119070000, @code='ps-70', @ref='Ps 70', @ch=70, @verses=5, @bkId=119000000
EXEC add_Chapter @id=119071000, @code='ps-71', @ref='Ps 71', @ch=71, @verses=24, @bkId=119000000
EXEC add_Chapter @id=119072000, @code='ps-72', @ref='Ps 72', @ch=72, @verses=20, @bkId=119000000
EXEC add_Chapter @id=119073000, @code='ps-73', @ref='Ps 73', @ch=73, @verses=28, @bkId=119000000
EXEC add_Chapter @id=119074000, @code='ps-74', @ref='Ps 74', @ch=74, @verses=23, @bkId=119000000
EXEC add_Chapter @id=119075000, @code='ps-75', @ref='Ps 75', @ch=75, @verses=10, @bkId=119000000
EXEC add_Chapter @id=119076000, @code='ps-76', @ref='Ps 76', @ch=76, @verses=12, @bkId=119000000
EXEC add_Chapter @id=119077000, @code='ps-77', @ref='Ps 77', @ch=77, @verses=20, @bkId=119000000
EXEC add_Chapter @id=119078000, @code='ps-78', @ref='Ps 78', @ch=78, @verses=72, @bkId=119000000
EXEC add_Chapter @id=119079000, @code='ps-79', @ref='Ps 79', @ch=79, @verses=13, @bkId=119000000
EXEC add_Chapter @id=119080000, @code='ps-80', @ref='Ps 80', @ch=80, @verses=19, @bkId=119000000
EXEC add_Chapter @id=119081000, @code='ps-81', @ref='Ps 81', @ch=81, @verses=16, @bkId=119000000
EXEC add_Chapter @id=119082000, @code='ps-82', @ref='Ps 82', @ch=82, @verses=8, @bkId=119000000
EXEC add_Chapter @id=119083000, @code='ps-83', @ref='Ps 83', @ch=83, @verses=18, @bkId=119000000
EXEC add_Chapter @id=119084000, @code='ps-84', @ref='Ps 84', @ch=84, @verses=12, @bkId=119000000
EXEC add_Chapter @id=119085000, @code='ps-85', @ref='Ps 85', @ch=85, @verses=13, @bkId=119000000
EXEC add_Chapter @id=119086000, @code='ps-86', @ref='Ps 86', @ch=86, @verses=17, @bkId=119000000
EXEC add_Chapter @id=119087000, @code='ps-87', @ref='Ps 87', @ch=87, @verses=7, @bkId=119000000
EXEC add_Chapter @id=119088000, @code='ps-88', @ref='Ps 88', @ch=88, @verses=18, @bkId=119000000
EXEC add_Chapter @id=119089000, @code='ps-89', @ref='Ps 89', @ch=89, @verses=52, @bkId=119000000
EXEC add_Chapter @id=119090000, @code='ps-90', @ref='Ps 90', @ch=90, @verses=17, @bkId=119000000
EXEC add_Chapter @id=119091000, @code='ps-91', @ref='Ps 91', @ch=91, @verses=16, @bkId=119000000
EXEC add_Chapter @id=119092000, @code='ps-92', @ref='Ps 92', @ch=92, @verses=15, @bkId=119000000
EXEC add_Chapter @id=119093000, @code='ps-93', @ref='Ps 93', @ch=93, @verses=5, @bkId=119000000
EXEC add_Chapter @id=119094000, @code='ps-94', @ref='Ps 94', @ch=94, @verses=23, @bkId=119000000
EXEC add_Chapter @id=119095000, @code='ps-95', @ref='Ps 95', @ch=95, @verses=11, @bkId=119000000
EXEC add_Chapter @id=119096000, @code='ps-96', @ref='Ps 96', @ch=96, @verses=13, @bkId=119000000
EXEC add_Chapter @id=119097000, @code='ps-97', @ref='Ps 97', @ch=97, @verses=12, @bkId=119000000
EXEC add_Chapter @id=119098000, @code='ps-98', @ref='Ps 98', @ch=98, @verses=9, @bkId=119000000
EXEC add_Chapter @id=119099000, @code='ps-99', @ref='Ps 99', @ch=99, @verses=9, @bkId=119000000
EXEC add_Chapter @id=119100000, @code='ps-100', @ref='Ps 100', @ch=100, @verses=5, @bkId=119000000
EXEC add_Chapter @id=119101000, @code='ps-101', @ref='Ps 101', @ch=101, @verses=8, @bkId=119000000
EXEC add_Chapter @id=119102000, @code='ps-102', @ref='Ps 102', @ch=102, @verses=28, @bkId=119000000
EXEC add_Chapter @id=119103000, @code='ps-103', @ref='Ps 103', @ch=103, @verses=22, @bkId=119000000
EXEC add_Chapter @id=119104000, @code='ps-104', @ref='Ps 104', @ch=104, @verses=35, @bkId=119000000
EXEC add_Chapter @id=119105000, @code='ps-105', @ref='Ps 105', @ch=105, @verses=45, @bkId=119000000
EXEC add_Chapter @id=119106000, @code='ps-106', @ref='Ps 106', @ch=106, @verses=48, @bkId=119000000
EXEC add_Chapter @id=119107000, @code='ps-107', @ref='Ps 107', @ch=107, @verses=43, @bkId=119000000
EXEC add_Chapter @id=119108000, @code='ps-108', @ref='Ps 108', @ch=108, @verses=13, @bkId=119000000
EXEC add_Chapter @id=119109000, @code='ps-109', @ref='Ps 109', @ch=109, @verses=31, @bkId=119000000
EXEC add_Chapter @id=119110000, @code='ps-110', @ref='Ps 110', @ch=110, @verses=7, @bkId=119000000
EXEC add_Chapter @id=119111000, @code='ps-111', @ref='Ps 111', @ch=111, @verses=10, @bkId=119000000
EXEC add_Chapter @id=119112000, @code='ps-112', @ref='Ps 112', @ch=112, @verses=10, @bkId=119000000
EXEC add_Chapter @id=119113000, @code='ps-113', @ref='Ps 113', @ch=113, @verses=9, @bkId=119000000
EXEC add_Chapter @id=119114000, @code='ps-114', @ref='Ps 114', @ch=114, @verses=8, @bkId=119000000
EXEC add_Chapter @id=119115000, @code='ps-115', @ref='Ps 115', @ch=115, @verses=18, @bkId=119000000
EXEC add_Chapter @id=119116000, @code='ps-116', @ref='Ps 116', @ch=116, @verses=19, @bkId=119000000
EXEC add_Chapter @id=119117000, @code='ps-117', @ref='Ps 117', @ch=117, @verses=2, @bkId=119000000
EXEC add_Chapter @id=119118000, @code='ps-118', @ref='Ps 118', @ch=118, @verses=29, @bkId=119000000
EXEC add_Chapter @id=119119000, @code='ps-119', @ref='Ps 119', @ch=119, @verses=176, @bkId=119000000
EXEC add_Chapter @id=119120000, @code='ps-120', @ref='Ps 120', @ch=120, @verses=7, @bkId=119000000
EXEC add_Chapter @id=119121000, @code='ps-121', @ref='Ps 121', @ch=121, @verses=8, @bkId=119000000
EXEC add_Chapter @id=119122000, @code='ps-122', @ref='Ps 122', @ch=122, @verses=9, @bkId=119000000
EXEC add_Chapter @id=119123000, @code='ps-123', @ref='Ps 123', @ch=123, @verses=4, @bkId=119000000
EXEC add_Chapter @id=119124000, @code='ps-124', @ref='Ps 124', @ch=124, @verses=8, @bkId=119000000
EXEC add_Chapter @id=119125000, @code='ps-125', @ref='Ps 125', @ch=125, @verses=5, @bkId=119000000
EXEC add_Chapter @id=119126000, @code='ps-126', @ref='Ps 126', @ch=126, @verses=6, @bkId=119000000
EXEC add_Chapter @id=119127000, @code='ps-127', @ref='Ps 127', @ch=127, @verses=5, @bkId=119000000
EXEC add_Chapter @id=119128000, @code='ps-128', @ref='Ps 128', @ch=128, @verses=6, @bkId=119000000
EXEC add_Chapter @id=119129000, @code='ps-129', @ref='Ps 129', @ch=129, @verses=8, @bkId=119000000
EXEC add_Chapter @id=119130000, @code='ps-130', @ref='Ps 130', @ch=130, @verses=8, @bkId=119000000
EXEC add_Chapter @id=119131000, @code='ps-131', @ref='Ps 131', @ch=131, @verses=3, @bkId=119000000
EXEC add_Chapter @id=119132000, @code='ps-132', @ref='Ps 132', @ch=132, @verses=18, @bkId=119000000
EXEC add_Chapter @id=119133000, @code='ps-133', @ref='Ps 133', @ch=133, @verses=3, @bkId=119000000
EXEC add_Chapter @id=119134000, @code='ps-134', @ref='Ps 134', @ch=134, @verses=3, @bkId=119000000
EXEC add_Chapter @id=119135000, @code='ps-135', @ref='Ps 135', @ch=135, @verses=21, @bkId=119000000
EXEC add_Chapter @id=119136000, @code='ps-136', @ref='Ps 136', @ch=136, @verses=26, @bkId=119000000
EXEC add_Chapter @id=119137000, @code='ps-137', @ref='Ps 137', @ch=137, @verses=9, @bkId=119000000
EXEC add_Chapter @id=119138000, @code='ps-138', @ref='Ps 138', @ch=138, @verses=8, @bkId=119000000
EXEC add_Chapter @id=119139000, @code='ps-139', @ref='Ps 139', @ch=139, @verses=24, @bkId=119000000
EXEC add_Chapter @id=119140000, @code='ps-140', @ref='Ps 140', @ch=140, @verses=13, @bkId=119000000
EXEC add_Chapter @id=119141000, @code='ps-141', @ref='Ps 141', @ch=141, @verses=10, @bkId=119000000
EXEC add_Chapter @id=119142000, @code='ps-142', @ref='Ps 142', @ch=142, @verses=7, @bkId=119000000
EXEC add_Chapter @id=119143000, @code='ps-143', @ref='Ps 143', @ch=143, @verses=12, @bkId=119000000
EXEC add_Chapter @id=119144000, @code='ps-144', @ref='Ps 144', @ch=144, @verses=15, @bkId=119000000
EXEC add_Chapter @id=119145000, @code='ps-145', @ref='Ps 145', @ch=145, @verses=21, @bkId=119000000
EXEC add_Chapter @id=119146000, @code='ps-146', @ref='Ps 146', @ch=146, @verses=10, @bkId=119000000
EXEC add_Chapter @id=119147000, @code='ps-147', @ref='Ps 147', @ch=147, @verses=20, @bkId=119000000
EXEC add_Chapter @id=119148000, @code='ps-148', @ref='Ps 148', @ch=148, @verses=14, @bkId=119000000
EXEC add_Chapter @id=119149000, @code='ps-149', @ref='Ps 149', @ch=149, @verses=9, @bkId=119000000
EXEC add_Chapter @id=119150000, @code='ps-150', @ref='Ps 150', @ch=150, @verses=6, @bkId=119000000, @bkEnd=1
EXEC add_Chapter @id=120001000, @code='pro-1', @ref='Pro 1', @ch=1, @verses=33, @bkId=120000000
EXEC add_Chapter @id=120002000, @code='pro-2', @ref='Pro 2', @ch=2, @verses=22, @bkId=120000000
EXEC add_Chapter @id=120003000, @code='pro-3', @ref='Pro 3', @ch=3, @verses=35, @bkId=120000000
EXEC add_Chapter @id=120004000, @code='pro-4', @ref='Pro 4', @ch=4, @verses=27, @bkId=120000000
EXEC add_Chapter @id=120005000, @code='pro-5', @ref='Pro 5', @ch=5, @verses=23, @bkId=120000000
EXEC add_Chapter @id=120006000, @code='pro-6', @ref='Pro 6', @ch=6, @verses=35, @bkId=120000000
EXEC add_Chapter @id=120007000, @code='pro-7', @ref='Pro 7', @ch=7, @verses=27, @bkId=120000000
EXEC add_Chapter @id=120008000, @code='pro-8', @ref='Pro 8', @ch=8, @verses=36, @bkId=120000000
EXEC add_Chapter @id=120009000, @code='pro-9', @ref='Pro 9', @ch=9, @verses=18, @bkId=120000000
EXEC add_Chapter @id=120010000, @code='pro-10', @ref='Pro 10', @ch=10, @verses=32, @bkId=120000000
EXEC add_Chapter @id=120011000, @code='pro-11', @ref='Pro 11', @ch=11, @verses=31, @bkId=120000000
EXEC add_Chapter @id=120012000, @code='pro-12', @ref='Pro 12', @ch=12, @verses=28, @bkId=120000000
EXEC add_Chapter @id=120013000, @code='pro-13', @ref='Pro 13', @ch=13, @verses=25, @bkId=120000000
EXEC add_Chapter @id=120014000, @code='pro-14', @ref='Pro 14', @ch=14, @verses=35, @bkId=120000000
EXEC add_Chapter @id=120015000, @code='pro-15', @ref='Pro 15', @ch=15, @verses=33, @bkId=120000000
EXEC add_Chapter @id=120016000, @code='pro-16', @ref='Pro 16', @ch=16, @verses=33, @bkId=120000000
EXEC add_Chapter @id=120017000, @code='pro-17', @ref='Pro 17', @ch=17, @verses=28, @bkId=120000000
EXEC add_Chapter @id=120018000, @code='pro-18', @ref='Pro 18', @ch=18, @verses=24, @bkId=120000000
EXEC add_Chapter @id=120019000, @code='pro-19', @ref='Pro 19', @ch=19, @verses=29, @bkId=120000000
EXEC add_Chapter @id=120020000, @code='pro-20', @ref='Pro 20', @ch=20, @verses=30, @bkId=120000000
EXEC add_Chapter @id=120021000, @code='pro-21', @ref='Pro 21', @ch=21, @verses=31, @bkId=120000000
EXEC add_Chapter @id=120022000, @code='pro-22', @ref='Pro 22', @ch=22, @verses=29, @bkId=120000000
EXEC add_Chapter @id=120023000, @code='pro-23', @ref='Pro 23', @ch=23, @verses=35, @bkId=120000000
EXEC add_Chapter @id=120024000, @code='pro-24', @ref='Pro 24', @ch=24, @verses=34, @bkId=120000000
EXEC add_Chapter @id=120025000, @code='pro-25', @ref='Pro 25', @ch=25, @verses=28, @bkId=120000000
EXEC add_Chapter @id=120026000, @code='pro-26', @ref='Pro 26', @ch=26, @verses=28, @bkId=120000000
EXEC add_Chapter @id=120027000, @code='pro-27', @ref='Pro 27', @ch=27, @verses=27, @bkId=120000000
EXEC add_Chapter @id=120028000, @code='pro-28', @ref='Pro 28', @ch=28, @verses=28, @bkId=120000000
EXEC add_Chapter @id=120029000, @code='pro-29', @ref='Pro 29', @ch=29, @verses=27, @bkId=120000000
EXEC add_Chapter @id=120030000, @code='pro-30', @ref='Pro 30', @ch=30, @verses=33, @bkId=120000000
EXEC add_Chapter @id=120031000, @code='pro-31', @ref='Pro 31', @ch=31, @verses=31, @bkId=120000000, @bkEnd=1
EXEC add_Chapter @id=121001000, @code='ecc-1', @ref='Ecc 1', @ch=1, @verses=18, @bkId=121000000
EXEC add_Chapter @id=121002000, @code='ecc-2', @ref='Ecc 2', @ch=2, @verses=26, @bkId=121000000
EXEC add_Chapter @id=121003000, @code='ecc-3', @ref='Ecc 3', @ch=3, @verses=22, @bkId=121000000
EXEC add_Chapter @id=121004000, @code='ecc-4', @ref='Ecc 4', @ch=4, @verses=16, @bkId=121000000
EXEC add_Chapter @id=121005000, @code='ecc-5', @ref='Ecc 5', @ch=5, @verses=20, @bkId=121000000
EXEC add_Chapter @id=121006000, @code='ecc-6', @ref='Ecc 6', @ch=6, @verses=12, @bkId=121000000
EXEC add_Chapter @id=121007000, @code='ecc-7', @ref='Ecc 7', @ch=7, @verses=29, @bkId=121000000
EXEC add_Chapter @id=121008000, @code='ecc-8', @ref='Ecc 8', @ch=8, @verses=17, @bkId=121000000
EXEC add_Chapter @id=121009000, @code='ecc-9', @ref='Ecc 9', @ch=9, @verses=18, @bkId=121000000
EXEC add_Chapter @id=121010000, @code='ecc-10', @ref='Ecc 10', @ch=10, @verses=20, @bkId=121000000
EXEC add_Chapter @id=121011000, @code='ecc-11', @ref='Ecc 11', @ch=11, @verses=10, @bkId=121000000
EXEC add_Chapter @id=121012000, @code='ecc-12', @ref='Ecc 12', @ch=12, @verses=14, @bkId=121000000, @bkEnd=1
EXEC add_Chapter @id=122001000, @code='song-1', @ref='Song 1', @ch=1, @verses=17, @bkId=122000000
EXEC add_Chapter @id=122002000, @code='song-2', @ref='Song 2', @ch=2, @verses=17, @bkId=122000000
EXEC add_Chapter @id=122003000, @code='song-3', @ref='Song 3', @ch=3, @verses=11, @bkId=122000000
EXEC add_Chapter @id=122004000, @code='song-4', @ref='Song 4', @ch=4, @verses=16, @bkId=122000000
EXEC add_Chapter @id=122005000, @code='song-5', @ref='Song 5', @ch=5, @verses=16, @bkId=122000000
EXEC add_Chapter @id=122006000, @code='song-6', @ref='Song 6', @ch=6, @verses=13, @bkId=122000000
EXEC add_Chapter @id=122007000, @code='song-7', @ref='Song 7', @ch=7, @verses=13, @bkId=122000000
EXEC add_Chapter @id=122008000, @code='song-8', @ref='Song 8', @ch=8, @verses=14, @bkId=122000000, @bkEnd=1
EXEC add_Chapter @id=123001000, @code='isa-1', @ref='Isa 1', @ch=1, @verses=31, @bkId=123000000
EXEC add_Chapter @id=123002000, @code='isa-2', @ref='Isa 2', @ch=2, @verses=22, @bkId=123000000
EXEC add_Chapter @id=123003000, @code='isa-3', @ref='Isa 3', @ch=3, @verses=26, @bkId=123000000
EXEC add_Chapter @id=123004000, @code='isa-4', @ref='Isa 4', @ch=4, @verses=6, @bkId=123000000
EXEC add_Chapter @id=123005000, @code='isa-5', @ref='Isa 5', @ch=5, @verses=30, @bkId=123000000
EXEC add_Chapter @id=123006000, @code='isa-6', @ref='Isa 6', @ch=6, @verses=13, @bkId=123000000
EXEC add_Chapter @id=123007000, @code='isa-7', @ref='Isa 7', @ch=7, @verses=25, @bkId=123000000
EXEC add_Chapter @id=123008000, @code='isa-8', @ref='Isa 8', @ch=8, @verses=22, @bkId=123000000
EXEC add_Chapter @id=123009000, @code='isa-9', @ref='Isa 9', @ch=9, @verses=21, @bkId=123000000
EXEC add_Chapter @id=123010000, @code='isa-10', @ref='Isa 10', @ch=10, @verses=34, @bkId=123000000
EXEC add_Chapter @id=123011000, @code='isa-11', @ref='Isa 11', @ch=11, @verses=16, @bkId=123000000
EXEC add_Chapter @id=123012000, @code='isa-12', @ref='Isa 12', @ch=12, @verses=6, @bkId=123000000
EXEC add_Chapter @id=123013000, @code='isa-13', @ref='Isa 13', @ch=13, @verses=22, @bkId=123000000
EXEC add_Chapter @id=123014000, @code='isa-14', @ref='Isa 14', @ch=14, @verses=32, @bkId=123000000
EXEC add_Chapter @id=123015000, @code='isa-15', @ref='Isa 15', @ch=15, @verses=9, @bkId=123000000
EXEC add_Chapter @id=123016000, @code='isa-16', @ref='Isa 16', @ch=16, @verses=14, @bkId=123000000
EXEC add_Chapter @id=123017000, @code='isa-17', @ref='Isa 17', @ch=17, @verses=14, @bkId=123000000
EXEC add_Chapter @id=123018000, @code='isa-18', @ref='Isa 18', @ch=18, @verses=7, @bkId=123000000
EXEC add_Chapter @id=123019000, @code='isa-19', @ref='Isa 19', @ch=19, @verses=25, @bkId=123000000
EXEC add_Chapter @id=123020000, @code='isa-20', @ref='Isa 20', @ch=20, @verses=6, @bkId=123000000
EXEC add_Chapter @id=123021000, @code='isa-21', @ref='Isa 21', @ch=21, @verses=17, @bkId=123000000
EXEC add_Chapter @id=123022000, @code='isa-22', @ref='Isa 22', @ch=22, @verses=25, @bkId=123000000
EXEC add_Chapter @id=123023000, @code='isa-23', @ref='Isa 23', @ch=23, @verses=18, @bkId=123000000
EXEC add_Chapter @id=123024000, @code='isa-24', @ref='Isa 24', @ch=24, @verses=23, @bkId=123000000
EXEC add_Chapter @id=123025000, @code='isa-25', @ref='Isa 25', @ch=25, @verses=12, @bkId=123000000
EXEC add_Chapter @id=123026000, @code='isa-26', @ref='Isa 26', @ch=26, @verses=21, @bkId=123000000
EXEC add_Chapter @id=123027000, @code='isa-27', @ref='Isa 27', @ch=27, @verses=13, @bkId=123000000
EXEC add_Chapter @id=123028000, @code='isa-28', @ref='Isa 28', @ch=28, @verses=29, @bkId=123000000
EXEC add_Chapter @id=123029000, @code='isa-29', @ref='Isa 29', @ch=29, @verses=24, @bkId=123000000
EXEC add_Chapter @id=123030000, @code='isa-30', @ref='Isa 30', @ch=30, @verses=33, @bkId=123000000
EXEC add_Chapter @id=123031000, @code='isa-31', @ref='Isa 31', @ch=31, @verses=9, @bkId=123000000
EXEC add_Chapter @id=123032000, @code='isa-32', @ref='Isa 32', @ch=32, @verses=20, @bkId=123000000
EXEC add_Chapter @id=123033000, @code='isa-33', @ref='Isa 33', @ch=33, @verses=24, @bkId=123000000
EXEC add_Chapter @id=123034000, @code='isa-34', @ref='Isa 34', @ch=34, @verses=17, @bkId=123000000
EXEC add_Chapter @id=123035000, @code='isa-35', @ref='Isa 35', @ch=35, @verses=10, @bkId=123000000
EXEC add_Chapter @id=123036000, @code='isa-36', @ref='Isa 36', @ch=36, @verses=22, @bkId=123000000
EXEC add_Chapter @id=123037000, @code='isa-37', @ref='Isa 37', @ch=37, @verses=38, @bkId=123000000
EXEC add_Chapter @id=123038000, @code='isa-38', @ref='Isa 38', @ch=38, @verses=22, @bkId=123000000
EXEC add_Chapter @id=123039000, @code='isa-39', @ref='Isa 39', @ch=39, @verses=8, @bkId=123000000
EXEC add_Chapter @id=123040000, @code='isa-40', @ref='Isa 40', @ch=40, @verses=31, @bkId=123000000
EXEC add_Chapter @id=123041000, @code='isa-41', @ref='Isa 41', @ch=41, @verses=29, @bkId=123000000
EXEC add_Chapter @id=123042000, @code='isa-42', @ref='Isa 42', @ch=42, @verses=25, @bkId=123000000
EXEC add_Chapter @id=123043000, @code='isa-43', @ref='Isa 43', @ch=43, @verses=28, @bkId=123000000
EXEC add_Chapter @id=123044000, @code='isa-44', @ref='Isa 44', @ch=44, @verses=28, @bkId=123000000
EXEC add_Chapter @id=123045000, @code='isa-45', @ref='Isa 45', @ch=45, @verses=25, @bkId=123000000
EXEC add_Chapter @id=123046000, @code='isa-46', @ref='Isa 46', @ch=46, @verses=13, @bkId=123000000
EXEC add_Chapter @id=123047000, @code='isa-47', @ref='Isa 47', @ch=47, @verses=15, @bkId=123000000
EXEC add_Chapter @id=123048000, @code='isa-48', @ref='Isa 48', @ch=48, @verses=22, @bkId=123000000
EXEC add_Chapter @id=123049000, @code='isa-49', @ref='Isa 49', @ch=49, @verses=26, @bkId=123000000
EXEC add_Chapter @id=123050000, @code='isa-50', @ref='Isa 50', @ch=50, @verses=11, @bkId=123000000
EXEC add_Chapter @id=123051000, @code='isa-51', @ref='Isa 51', @ch=51, @verses=23, @bkId=123000000
EXEC add_Chapter @id=123052000, @code='isa-52', @ref='Isa 52', @ch=52, @verses=15, @bkId=123000000
EXEC add_Chapter @id=123053000, @code='isa-53', @ref='Isa 53', @ch=53, @verses=12, @bkId=123000000
EXEC add_Chapter @id=123054000, @code='isa-54', @ref='Isa 54', @ch=54, @verses=17, @bkId=123000000
EXEC add_Chapter @id=123055000, @code='isa-55', @ref='Isa 55', @ch=55, @verses=13, @bkId=123000000
EXEC add_Chapter @id=123056000, @code='isa-56', @ref='Isa 56', @ch=56, @verses=12, @bkId=123000000
EXEC add_Chapter @id=123057000, @code='isa-57', @ref='Isa 57', @ch=57, @verses=21, @bkId=123000000
EXEC add_Chapter @id=123058000, @code='isa-58', @ref='Isa 58', @ch=58, @verses=14, @bkId=123000000
EXEC add_Chapter @id=123059000, @code='isa-59', @ref='Isa 59', @ch=59, @verses=21, @bkId=123000000
EXEC add_Chapter @id=123060000, @code='isa-60', @ref='Isa 60', @ch=60, @verses=22, @bkId=123000000
EXEC add_Chapter @id=123061000, @code='isa-61', @ref='Isa 61', @ch=61, @verses=11, @bkId=123000000
EXEC add_Chapter @id=123062000, @code='isa-62', @ref='Isa 62', @ch=62, @verses=12, @bkId=123000000
EXEC add_Chapter @id=123063000, @code='isa-63', @ref='Isa 63', @ch=63, @verses=19, @bkId=123000000
EXEC add_Chapter @id=123064000, @code='isa-64', @ref='Isa 64', @ch=64, @verses=12, @bkId=123000000
EXEC add_Chapter @id=123065000, @code='isa-65', @ref='Isa 65', @ch=65, @verses=25, @bkId=123000000
EXEC add_Chapter @id=123066000, @code='isa-66', @ref='Isa 66', @ch=66, @verses=24, @bkId=123000000, @bkEnd=1
EXEC add_Chapter @id=124001000, @code='jer-1', @ref='Jer 1', @ch=1, @verses=19, @bkId=124000000
EXEC add_Chapter @id=124002000, @code='jer-2', @ref='Jer 2', @ch=2, @verses=37, @bkId=124000000
EXEC add_Chapter @id=124003000, @code='jer-3', @ref='Jer 3', @ch=3, @verses=25, @bkId=124000000
EXEC add_Chapter @id=124004000, @code='jer-4', @ref='Jer 4', @ch=4, @verses=31, @bkId=124000000
EXEC add_Chapter @id=124005000, @code='jer-5', @ref='Jer 5', @ch=5, @verses=31, @bkId=124000000
EXEC add_Chapter @id=124006000, @code='jer-6', @ref='Jer 6', @ch=6, @verses=30, @bkId=124000000
EXEC add_Chapter @id=124007000, @code='jer-7', @ref='Jer 7', @ch=7, @verses=34, @bkId=124000000
EXEC add_Chapter @id=124008000, @code='jer-8', @ref='Jer 8', @ch=8, @verses=22, @bkId=124000000
EXEC add_Chapter @id=124009000, @code='jer-9', @ref='Jer 9', @ch=9, @verses=26, @bkId=124000000
EXEC add_Chapter @id=124010000, @code='jer-10', @ref='Jer 10', @ch=10, @verses=25, @bkId=124000000
EXEC add_Chapter @id=124011000, @code='jer-11', @ref='Jer 11', @ch=11, @verses=23, @bkId=124000000
EXEC add_Chapter @id=124012000, @code='jer-12', @ref='Jer 12', @ch=12, @verses=17, @bkId=124000000
EXEC add_Chapter @id=124013000, @code='jer-13', @ref='Jer 13', @ch=13, @verses=27, @bkId=124000000
EXEC add_Chapter @id=124014000, @code='jer-14', @ref='Jer 14', @ch=14, @verses=22, @bkId=124000000
EXEC add_Chapter @id=124015000, @code='jer-15', @ref='Jer 15', @ch=15, @verses=21, @bkId=124000000
EXEC add_Chapter @id=124016000, @code='jer-16', @ref='Jer 16', @ch=16, @verses=21, @bkId=124000000
EXEC add_Chapter @id=124017000, @code='jer-17', @ref='Jer 17', @ch=17, @verses=27, @bkId=124000000
EXEC add_Chapter @id=124018000, @code='jer-18', @ref='Jer 18', @ch=18, @verses=23, @bkId=124000000
EXEC add_Chapter @id=124019000, @code='jer-19', @ref='Jer 19', @ch=19, @verses=15, @bkId=124000000
EXEC add_Chapter @id=124020000, @code='jer-20', @ref='Jer 20', @ch=20, @verses=18, @bkId=124000000
EXEC add_Chapter @id=124021000, @code='jer-21', @ref='Jer 21', @ch=21, @verses=14, @bkId=124000000
EXEC add_Chapter @id=124022000, @code='jer-22', @ref='Jer 22', @ch=22, @verses=30, @bkId=124000000
EXEC add_Chapter @id=124023000, @code='jer-23', @ref='Jer 23', @ch=23, @verses=40, @bkId=124000000
EXEC add_Chapter @id=124024000, @code='jer-24', @ref='Jer 24', @ch=24, @verses=10, @bkId=124000000
EXEC add_Chapter @id=124025000, @code='jer-25', @ref='Jer 25', @ch=25, @verses=38, @bkId=124000000
EXEC add_Chapter @id=124026000, @code='jer-26', @ref='Jer 26', @ch=26, @verses=24, @bkId=124000000
EXEC add_Chapter @id=124027000, @code='jer-27', @ref='Jer 27', @ch=27, @verses=22, @bkId=124000000
EXEC add_Chapter @id=124028000, @code='jer-28', @ref='Jer 28', @ch=28, @verses=17, @bkId=124000000
EXEC add_Chapter @id=124029000, @code='jer-29', @ref='Jer 29', @ch=29, @verses=32, @bkId=124000000
EXEC add_Chapter @id=124030000, @code='jer-30', @ref='Jer 30', @ch=30, @verses=24, @bkId=124000000
EXEC add_Chapter @id=124031000, @code='jer-31', @ref='Jer 31', @ch=31, @verses=40, @bkId=124000000
EXEC add_Chapter @id=124032000, @code='jer-32', @ref='Jer 32', @ch=32, @verses=44, @bkId=124000000
EXEC add_Chapter @id=124033000, @code='jer-33', @ref='Jer 33', @ch=33, @verses=26, @bkId=124000000
EXEC add_Chapter @id=124034000, @code='jer-34', @ref='Jer 34', @ch=34, @verses=22, @bkId=124000000
EXEC add_Chapter @id=124035000, @code='jer-35', @ref='Jer 35', @ch=35, @verses=19, @bkId=124000000
EXEC add_Chapter @id=124036000, @code='jer-36', @ref='Jer 36', @ch=36, @verses=32, @bkId=124000000
EXEC add_Chapter @id=124037000, @code='jer-37', @ref='Jer 37', @ch=37, @verses=21, @bkId=124000000
EXEC add_Chapter @id=124038000, @code='jer-38', @ref='Jer 38', @ch=38, @verses=28, @bkId=124000000
EXEC add_Chapter @id=124039000, @code='jer-39', @ref='Jer 39', @ch=39, @verses=18, @bkId=124000000
EXEC add_Chapter @id=124040000, @code='jer-40', @ref='Jer 40', @ch=40, @verses=16, @bkId=124000000
EXEC add_Chapter @id=124041000, @code='jer-41', @ref='Jer 41', @ch=41, @verses=18, @bkId=124000000
EXEC add_Chapter @id=124042000, @code='jer-42', @ref='Jer 42', @ch=42, @verses=22, @bkId=124000000
EXEC add_Chapter @id=124043000, @code='jer-43', @ref='Jer 43', @ch=43, @verses=13, @bkId=124000000
EXEC add_Chapter @id=124044000, @code='jer-44', @ref='Jer 44', @ch=44, @verses=30, @bkId=124000000
EXEC add_Chapter @id=124045000, @code='jer-45', @ref='Jer 45', @ch=45, @verses=5, @bkId=124000000
EXEC add_Chapter @id=124046000, @code='jer-46', @ref='Jer 46', @ch=46, @verses=28, @bkId=124000000
EXEC add_Chapter @id=124047000, @code='jer-47', @ref='Jer 47', @ch=47, @verses=7, @bkId=124000000
EXEC add_Chapter @id=124048000, @code='jer-48', @ref='Jer 48', @ch=48, @verses=47, @bkId=124000000
EXEC add_Chapter @id=124049000, @code='jer-49', @ref='Jer 49', @ch=49, @verses=39, @bkId=124000000
EXEC add_Chapter @id=124050000, @code='jer-50', @ref='Jer 50', @ch=50, @verses=46, @bkId=124000000
EXEC add_Chapter @id=124051000, @code='jer-51', @ref='Jer 51', @ch=51, @verses=64, @bkId=124000000
EXEC add_Chapter @id=124052000, @code='jer-52', @ref='Jer 52', @ch=52, @verses=34, @bkId=124000000, @bkEnd=1
EXEC add_Chapter @id=125001000, @code='lam-1', @ref='Lam 1', @ch=1, @verses=22, @bkId=125000000
EXEC add_Chapter @id=125002000, @code='lam-2', @ref='Lam 2', @ch=2, @verses=22, @bkId=125000000
EXEC add_Chapter @id=125003000, @code='lam-3', @ref='Lam 3', @ch=3, @verses=66, @bkId=125000000
EXEC add_Chapter @id=125004000, @code='lam-4', @ref='Lam 4', @ch=4, @verses=22, @bkId=125000000
EXEC add_Chapter @id=125005000, @code='lam-5', @ref='Lam 5', @ch=5, @verses=22, @bkId=125000000, @bkEnd=1
EXEC add_Chapter @id=126001000, @code='ezek-1', @ref='Ezek 1', @ch=1, @verses=28, @bkId=126000000
EXEC add_Chapter @id=126002000, @code='ezek-2', @ref='Ezek 2', @ch=2, @verses=10, @bkId=126000000
EXEC add_Chapter @id=126003000, @code='ezek-3', @ref='Ezek 3', @ch=3, @verses=27, @bkId=126000000
EXEC add_Chapter @id=126004000, @code='ezek-4', @ref='Ezek 4', @ch=4, @verses=17, @bkId=126000000
EXEC add_Chapter @id=126005000, @code='ezek-5', @ref='Ezek 5', @ch=5, @verses=17, @bkId=126000000
EXEC add_Chapter @id=126006000, @code='ezek-6', @ref='Ezek 6', @ch=6, @verses=14, @bkId=126000000
EXEC add_Chapter @id=126007000, @code='ezek-7', @ref='Ezek 7', @ch=7, @verses=27, @bkId=126000000
EXEC add_Chapter @id=126008000, @code='ezek-8', @ref='Ezek 8', @ch=8, @verses=18, @bkId=126000000
EXEC add_Chapter @id=126009000, @code='ezek-9', @ref='Ezek 9', @ch=9, @verses=11, @bkId=126000000
EXEC add_Chapter @id=126010000, @code='ezek-10', @ref='Ezek 10', @ch=10, @verses=22, @bkId=126000000
EXEC add_Chapter @id=126011000, @code='ezek-11', @ref='Ezek 11', @ch=11, @verses=25, @bkId=126000000
EXEC add_Chapter @id=126012000, @code='ezek-12', @ref='Ezek 12', @ch=12, @verses=28, @bkId=126000000
EXEC add_Chapter @id=126013000, @code='ezek-13', @ref='Ezek 13', @ch=13, @verses=23, @bkId=126000000
EXEC add_Chapter @id=126014000, @code='ezek-14', @ref='Ezek 14', @ch=14, @verses=23, @bkId=126000000
EXEC add_Chapter @id=126015000, @code='ezek-15', @ref='Ezek 15', @ch=15, @verses=8, @bkId=126000000
EXEC add_Chapter @id=126016000, @code='ezek-16', @ref='Ezek 16', @ch=16, @verses=63, @bkId=126000000
EXEC add_Chapter @id=126017000, @code='ezek-17', @ref='Ezek 17', @ch=17, @verses=24, @bkId=126000000
EXEC add_Chapter @id=126018000, @code='ezek-18', @ref='Ezek 18', @ch=18, @verses=32, @bkId=126000000
EXEC add_Chapter @id=126019000, @code='ezek-19', @ref='Ezek 19', @ch=19, @verses=14, @bkId=126000000
EXEC add_Chapter @id=126020000, @code='ezek-20', @ref='Ezek 20', @ch=20, @verses=49, @bkId=126000000
EXEC add_Chapter @id=126021000, @code='ezek-21', @ref='Ezek 21', @ch=21, @verses=32, @bkId=126000000
EXEC add_Chapter @id=126022000, @code='ezek-22', @ref='Ezek 22', @ch=22, @verses=31, @bkId=126000000
EXEC add_Chapter @id=126023000, @code='ezek-23', @ref='Ezek 23', @ch=23, @verses=49, @bkId=126000000
EXEC add_Chapter @id=126024000, @code='ezek-24', @ref='Ezek 24', @ch=24, @verses=27, @bkId=126000000
EXEC add_Chapter @id=126025000, @code='ezek-25', @ref='Ezek 25', @ch=25, @verses=17, @bkId=126000000
EXEC add_Chapter @id=126026000, @code='ezek-26', @ref='Ezek 26', @ch=26, @verses=21, @bkId=126000000
EXEC add_Chapter @id=126027000, @code='ezek-27', @ref='Ezek 27', @ch=27, @verses=36, @bkId=126000000
EXEC add_Chapter @id=126028000, @code='ezek-28', @ref='Ezek 28', @ch=28, @verses=26, @bkId=126000000
EXEC add_Chapter @id=126029000, @code='ezek-29', @ref='Ezek 29', @ch=29, @verses=21, @bkId=126000000
EXEC add_Chapter @id=126030000, @code='ezek-30', @ref='Ezek 30', @ch=30, @verses=26, @bkId=126000000
EXEC add_Chapter @id=126031000, @code='ezek-31', @ref='Ezek 31', @ch=31, @verses=18, @bkId=126000000
EXEC add_Chapter @id=126032000, @code='ezek-32', @ref='Ezek 32', @ch=32, @verses=32, @bkId=126000000
EXEC add_Chapter @id=126033000, @code='ezek-33', @ref='Ezek 33', @ch=33, @verses=33, @bkId=126000000
EXEC add_Chapter @id=126034000, @code='ezek-34', @ref='Ezek 34', @ch=34, @verses=31, @bkId=126000000
EXEC add_Chapter @id=126035000, @code='ezek-35', @ref='Ezek 35', @ch=35, @verses=15, @bkId=126000000
EXEC add_Chapter @id=126036000, @code='ezek-36', @ref='Ezek 36', @ch=36, @verses=38, @bkId=126000000
EXEC add_Chapter @id=126037000, @code='ezek-37', @ref='Ezek 37', @ch=37, @verses=28, @bkId=126000000
EXEC add_Chapter @id=126038000, @code='ezek-38', @ref='Ezek 38', @ch=38, @verses=23, @bkId=126000000
EXEC add_Chapter @id=126039000, @code='ezek-39', @ref='Ezek 39', @ch=39, @verses=29, @bkId=126000000
EXEC add_Chapter @id=126040000, @code='ezek-40', @ref='Ezek 40', @ch=40, @verses=49, @bkId=126000000
EXEC add_Chapter @id=126041000, @code='ezek-41', @ref='Ezek 41', @ch=41, @verses=26, @bkId=126000000
EXEC add_Chapter @id=126042000, @code='ezek-42', @ref='Ezek 42', @ch=42, @verses=20, @bkId=126000000
EXEC add_Chapter @id=126043000, @code='ezek-43', @ref='Ezek 43', @ch=43, @verses=27, @bkId=126000000
EXEC add_Chapter @id=126044000, @code='ezek-44', @ref='Ezek 44', @ch=44, @verses=31, @bkId=126000000
EXEC add_Chapter @id=126045000, @code='ezek-45', @ref='Ezek 45', @ch=45, @verses=25, @bkId=126000000
EXEC add_Chapter @id=126046000, @code='ezek-46', @ref='Ezek 46', @ch=46, @verses=24, @bkId=126000000
EXEC add_Chapter @id=126047000, @code='ezek-47', @ref='Ezek 47', @ch=47, @verses=23, @bkId=126000000
EXEC add_Chapter @id=126048000, @code='ezek-48', @ref='Ezek 48', @ch=48, @verses=35, @bkId=126000000, @bkEnd=1
EXEC add_Chapter @id=127001000, @code='dan-1', @ref='Dan 1', @ch=1, @verses=21, @bkId=127000000
EXEC add_Chapter @id=127002000, @code='dan-2', @ref='Dan 2', @ch=2, @verses=49, @bkId=127000000
EXEC add_Chapter @id=127003000, @code='dan-3', @ref='Dan 3', @ch=3, @verses=30, @bkId=127000000
EXEC add_Chapter @id=127004000, @code='dan-4', @ref='Dan 4', @ch=4, @verses=37, @bkId=127000000
EXEC add_Chapter @id=127005000, @code='dan-5', @ref='Dan 5', @ch=5, @verses=31, @bkId=127000000
EXEC add_Chapter @id=127006000, @code='dan-6', @ref='Dan 6', @ch=6, @verses=28, @bkId=127000000
EXEC add_Chapter @id=127007000, @code='dan-7', @ref='Dan 7', @ch=7, @verses=28, @bkId=127000000
EXEC add_Chapter @id=127008000, @code='dan-8', @ref='Dan 8', @ch=8, @verses=27, @bkId=127000000
EXEC add_Chapter @id=127009000, @code='dan-9', @ref='Dan 9', @ch=9, @verses=27, @bkId=127000000
EXEC add_Chapter @id=127010000, @code='dan-10', @ref='Dan 10', @ch=10, @verses=21, @bkId=127000000
EXEC add_Chapter @id=127011000, @code='dan-11', @ref='Dan 11', @ch=11, @verses=45, @bkId=127000000
EXEC add_Chapter @id=127012000, @code='dan-12', @ref='Dan 12', @ch=12, @verses=13, @bkId=127000000, @bkEnd=1
EXEC add_Chapter @id=128001000, @code='hos-1', @ref='Hos 1', @ch=1, @verses=11, @bkId=128000000
EXEC add_Chapter @id=128002000, @code='hos-2', @ref='Hos 2', @ch=2, @verses=23, @bkId=128000000
EXEC add_Chapter @id=128003000, @code='hos-3', @ref='Hos 3', @ch=3, @verses=5, @bkId=128000000
EXEC add_Chapter @id=128004000, @code='hos-4', @ref='Hos 4', @ch=4, @verses=19, @bkId=128000000
EXEC add_Chapter @id=128005000, @code='hos-5', @ref='Hos 5', @ch=5, @verses=15, @bkId=128000000
EXEC add_Chapter @id=128006000, @code='hos-6', @ref='Hos 6', @ch=6, @verses=11, @bkId=128000000
EXEC add_Chapter @id=128007000, @code='hos-7', @ref='Hos 7', @ch=7, @verses=16, @bkId=128000000
EXEC add_Chapter @id=128008000, @code='hos-8', @ref='Hos 8', @ch=8, @verses=14, @bkId=128000000
EXEC add_Chapter @id=128009000, @code='hos-9', @ref='Hos 9', @ch=9, @verses=17, @bkId=128000000
EXEC add_Chapter @id=128010000, @code='hos-10', @ref='Hos 10', @ch=10, @verses=15, @bkId=128000000
EXEC add_Chapter @id=128011000, @code='hos-11', @ref='Hos 11', @ch=11, @verses=12, @bkId=128000000
EXEC add_Chapter @id=128012000, @code='hos-12', @ref='Hos 12', @ch=12, @verses=14, @bkId=128000000
EXEC add_Chapter @id=128013000, @code='hos-13', @ref='Hos 13', @ch=13, @verses=16, @bkId=128000000
EXEC add_Chapter @id=128014000, @code='hos-14', @ref='Hos 14', @ch=14, @verses=9, @bkId=128000000, @bkEnd=1
EXEC add_Chapter @id=129001000, @code='joel-1', @ref='Joel 1', @ch=1, @verses=20, @bkId=129000000
EXEC add_Chapter @id=129002000, @code='joel-2', @ref='Joel 2', @ch=2, @verses=32, @bkId=129000000
EXEC add_Chapter @id=129003000, @code='joel-3', @ref='Joel 3', @ch=3, @verses=21, @bkId=129000000, @bkEnd=1
EXEC add_Chapter @id=130001000, @code='amos-1', @ref='Amos 1', @ch=1, @verses=15, @bkId=130000000
EXEC add_Chapter @id=130002000, @code='amos-2', @ref='Amos 2', @ch=2, @verses=16, @bkId=130000000
EXEC add_Chapter @id=130003000, @code='amos-3', @ref='Amos 3', @ch=3, @verses=15, @bkId=130000000
EXEC add_Chapter @id=130004000, @code='amos-4', @ref='Amos 4', @ch=4, @verses=13, @bkId=130000000
EXEC add_Chapter @id=130005000, @code='amos-5', @ref='Amos 5', @ch=5, @verses=27, @bkId=130000000
EXEC add_Chapter @id=130006000, @code='amos-6', @ref='Amos 6', @ch=6, @verses=14, @bkId=130000000
EXEC add_Chapter @id=130007000, @code='amos-7', @ref='Amos 7', @ch=7, @verses=17, @bkId=130000000
EXEC add_Chapter @id=130008000, @code='amos-8', @ref='Amos 8', @ch=8, @verses=14, @bkId=130000000
EXEC add_Chapter @id=130009000, @code='amos-9', @ref='Amos 9', @ch=9, @verses=15, @bkId=130000000, @bkEnd=1
EXEC add_Chapter @id=131001000, @code='oba-1', @ref='Oba 1', @ch=1, @verses=21, @bkId=131000000, @bkEnd=1
EXEC add_Chapter @id=132001000, @code='jonah-1', @ref='Jonah 1', @ch=1, @verses=17, @bkId=132000000
EXEC add_Chapter @id=132002000, @code='jonah-2', @ref='Jonah 2', @ch=2, @verses=10, @bkId=132000000
EXEC add_Chapter @id=132003000, @code='jonah-3', @ref='Jonah 3', @ch=3, @verses=10, @bkId=132000000
EXEC add_Chapter @id=132004000, @code='jonah-4', @ref='Jonah 4', @ch=4, @verses=11, @bkId=132000000, @bkEnd=1
EXEC add_Chapter @id=133001000, @code='mic-1', @ref='Mic 1', @ch=1, @verses=16, @bkId=133000000
EXEC add_Chapter @id=133002000, @code='mic-2', @ref='Mic 2', @ch=2, @verses=13, @bkId=133000000
EXEC add_Chapter @id=133003000, @code='mic-3', @ref='Mic 3', @ch=3, @verses=12, @bkId=133000000
EXEC add_Chapter @id=133004000, @code='mic-4', @ref='Mic 4', @ch=4, @verses=13, @bkId=133000000
EXEC add_Chapter @id=133005000, @code='mic-5', @ref='Mic 5', @ch=5, @verses=15, @bkId=133000000
EXEC add_Chapter @id=133006000, @code='mic-6', @ref='Mic 6', @ch=6, @verses=16, @bkId=133000000
EXEC add_Chapter @id=133007000, @code='mic-7', @ref='Mic 7', @ch=7, @verses=20, @bkId=133000000, @bkEnd=1
EXEC add_Chapter @id=134001000, @code='nah-1', @ref='Nah 1', @ch=1, @verses=15, @bkId=134000000
EXEC add_Chapter @id=134002000, @code='nah-2', @ref='Nah 2', @ch=2, @verses=13, @bkId=134000000
EXEC add_Chapter @id=134003000, @code='nah-3', @ref='Nah 3', @ch=3, @verses=19, @bkId=134000000, @bkEnd=1
EXEC add_Chapter @id=135001000, @code='hab-1', @ref='Hab 1', @ch=1, @verses=17, @bkId=135000000
EXEC add_Chapter @id=135002000, @code='hab-2', @ref='Hab 2', @ch=2, @verses=20, @bkId=135000000
EXEC add_Chapter @id=135003000, @code='hab-3', @ref='Hab 3', @ch=3, @verses=19, @bkId=135000000, @bkEnd=1
EXEC add_Chapter @id=136001000, @code='zeph-1', @ref='Zeph 1', @ch=1, @verses=18, @bkId=136000000
EXEC add_Chapter @id=136002000, @code='zeph-2', @ref='Zeph 2', @ch=2, @verses=15, @bkId=136000000
EXEC add_Chapter @id=136003000, @code='zeph-3', @ref='Zeph 3', @ch=3, @verses=20, @bkId=136000000, @bkEnd=1
EXEC add_Chapter @id=137001000, @code='hag-1', @ref='Hag 1', @ch=1, @verses=15, @bkId=137000000
EXEC add_Chapter @id=137002000, @code='hag-2', @ref='Hag 2', @ch=2, @verses=23, @bkId=137000000, @bkEnd=1
EXEC add_Chapter @id=138001000, @code='zec-1', @ref='Zec 1', @ch=1, @verses=21, @bkId=138000000
EXEC add_Chapter @id=138002000, @code='zec-2', @ref='Zec 2', @ch=2, @verses=13, @bkId=138000000
EXEC add_Chapter @id=138003000, @code='zec-3', @ref='Zec 3', @ch=3, @verses=10, @bkId=138000000
EXEC add_Chapter @id=138004000, @code='zec-4', @ref='Zec 4', @ch=4, @verses=14, @bkId=138000000
EXEC add_Chapter @id=138005000, @code='zec-5', @ref='Zec 5', @ch=5, @verses=11, @bkId=138000000
EXEC add_Chapter @id=138006000, @code='zec-6', @ref='Zec 6', @ch=6, @verses=15, @bkId=138000000
EXEC add_Chapter @id=138007000, @code='zec-7', @ref='Zec 7', @ch=7, @verses=14, @bkId=138000000
EXEC add_Chapter @id=138008000, @code='zec-8', @ref='Zec 8', @ch=8, @verses=23, @bkId=138000000
EXEC add_Chapter @id=138009000, @code='zec-9', @ref='Zec 9', @ch=9, @verses=17, @bkId=138000000
EXEC add_Chapter @id=138010000, @code='zec-10', @ref='Zec 10', @ch=10, @verses=12, @bkId=138000000
EXEC add_Chapter @id=138011000, @code='zec-11', @ref='Zec 11', @ch=11, @verses=17, @bkId=138000000
EXEC add_Chapter @id=138012000, @code='zec-12', @ref='Zec 12', @ch=12, @verses=14, @bkId=138000000
EXEC add_Chapter @id=138013000, @code='zec-13', @ref='Zec 13', @ch=13, @verses=9, @bkId=138000000
EXEC add_Chapter @id=138014000, @code='zec-14', @ref='Zec 14', @ch=14, @verses=21, @bkId=138000000, @bkEnd=1
EXEC add_Chapter @id=139001000, @code='mal-1', @ref='Mal 1', @ch=1, @verses=14, @bkId=139000000
EXEC add_Chapter @id=139002000, @code='mal-2', @ref='Mal 2', @ch=2, @verses=17, @bkId=139000000
EXEC add_Chapter @id=139003000, @code='mal-3', @ref='Mal 3', @ch=3, @verses=18, @bkId=139000000
EXEC add_Chapter @id=139004000, @code='mal-4', @ref='Mal 4', @ch=4, @verses=6, @bkId=139000000, @bkEnd=1
EXEC add_Chapter @id=340001000, @code='matt-1', @ref='Matt 1', @ch=1, @verses=25, @bkId=340000000
EXEC add_Chapter @id=340002000, @code='matt-2', @ref='Matt 2', @ch=2, @verses=23, @bkId=340000000
EXEC add_Chapter @id=340003000, @code='matt-3', @ref='Matt 3', @ch=3, @verses=17, @bkId=340000000
EXEC add_Chapter @id=340004000, @code='matt-4', @ref='Matt 4', @ch=4, @verses=25, @bkId=340000000
EXEC add_Chapter @id=340005000, @code='matt-5', @ref='Matt 5', @ch=5, @verses=48, @bkId=340000000
EXEC add_Chapter @id=340006000, @code='matt-6', @ref='Matt 6', @ch=6, @verses=34, @bkId=340000000
EXEC add_Chapter @id=340007000, @code='matt-7', @ref='Matt 7', @ch=7, @verses=29, @bkId=340000000
EXEC add_Chapter @id=340008000, @code='matt-8', @ref='Matt 8', @ch=8, @verses=34, @bkId=340000000
EXEC add_Chapter @id=340009000, @code='matt-9', @ref='Matt 9', @ch=9, @verses=38, @bkId=340000000
EXEC add_Chapter @id=340010000, @code='matt-10', @ref='Matt 10', @ch=10, @verses=42, @bkId=340000000
EXEC add_Chapter @id=340011000, @code='matt-11', @ref='Matt 11', @ch=11, @verses=30, @bkId=340000000
EXEC add_Chapter @id=340012000, @code='matt-12', @ref='Matt 12', @ch=12, @verses=50, @bkId=340000000
EXEC add_Chapter @id=340013000, @code='matt-13', @ref='Matt 13', @ch=13, @verses=58, @bkId=340000000
EXEC add_Chapter @id=340014000, @code='matt-14', @ref='Matt 14', @ch=14, @verses=36, @bkId=340000000
EXEC add_Chapter @id=340015000, @code='matt-15', @ref='Matt 15', @ch=15, @verses=39, @bkId=340000000
EXEC add_Chapter @id=340016000, @code='matt-16', @ref='Matt 16', @ch=16, @verses=28, @bkId=340000000
EXEC add_Chapter @id=340017000, @code='matt-17', @ref='Matt 17', @ch=17, @verses=27, @bkId=340000000
EXEC add_Chapter @id=340018000, @code='matt-18', @ref='Matt 18', @ch=18, @verses=35, @bkId=340000000
EXEC add_Chapter @id=340019000, @code='matt-19', @ref='Matt 19', @ch=19, @verses=30, @bkId=340000000
EXEC add_Chapter @id=340020000, @code='matt-20', @ref='Matt 20', @ch=20, @verses=34, @bkId=340000000
EXEC add_Chapter @id=340021000, @code='matt-21', @ref='Matt 21', @ch=21, @verses=46, @bkId=340000000
EXEC add_Chapter @id=340022000, @code='matt-22', @ref='Matt 22', @ch=22, @verses=46, @bkId=340000000
EXEC add_Chapter @id=340023000, @code='matt-23', @ref='Matt 23', @ch=23, @verses=39, @bkId=340000000
EXEC add_Chapter @id=340024000, @code='matt-24', @ref='Matt 24', @ch=24, @verses=51, @bkId=340000000
EXEC add_Chapter @id=340025000, @code='matt-25', @ref='Matt 25', @ch=25, @verses=46, @bkId=340000000
EXEC add_Chapter @id=340026000, @code='matt-26', @ref='Matt 26', @ch=26, @verses=75, @bkId=340000000
EXEC add_Chapter @id=340027000, @code='matt-27', @ref='Matt 27', @ch=27, @verses=66, @bkId=340000000
EXEC add_Chapter @id=340028000, @code='matt-28', @ref='Matt 28', @ch=28, @verses=20, @bkId=340000000, @bkEnd=1
EXEC add_Chapter @id=341001000, @code='mark-1', @ref='Mark 1', @ch=1, @verses=45, @bkId=341000000
EXEC add_Chapter @id=341002000, @code='mark-2', @ref='Mark 2', @ch=2, @verses=28, @bkId=341000000
EXEC add_Chapter @id=341003000, @code='mark-3', @ref='Mark 3', @ch=3, @verses=35, @bkId=341000000
EXEC add_Chapter @id=341004000, @code='mark-4', @ref='Mark 4', @ch=4, @verses=41, @bkId=341000000
EXEC add_Chapter @id=341005000, @code='mark-5', @ref='Mark 5', @ch=5, @verses=43, @bkId=341000000
EXEC add_Chapter @id=341006000, @code='mark-6', @ref='Mark 6', @ch=6, @verses=56, @bkId=341000000
EXEC add_Chapter @id=341007000, @code='mark-7', @ref='Mark 7', @ch=7, @verses=37, @bkId=341000000
EXEC add_Chapter @id=341008000, @code='mark-8', @ref='Mark 8', @ch=8, @verses=38, @bkId=341000000
EXEC add_Chapter @id=341009000, @code='mark-9', @ref='Mark 9', @ch=9, @verses=50, @bkId=341000000
EXEC add_Chapter @id=341010000, @code='mark-10', @ref='Mark 10', @ch=10, @verses=52, @bkId=341000000
EXEC add_Chapter @id=341011000, @code='mark-11', @ref='Mark 11', @ch=11, @verses=33, @bkId=341000000
EXEC add_Chapter @id=341012000, @code='mark-12', @ref='Mark 12', @ch=12, @verses=44, @bkId=341000000
EXEC add_Chapter @id=341013000, @code='mark-13', @ref='Mark 13', @ch=13, @verses=37, @bkId=341000000
EXEC add_Chapter @id=341014000, @code='mark-14', @ref='Mark 14', @ch=14, @verses=72, @bkId=341000000
EXEC add_Chapter @id=341015000, @code='mark-15', @ref='Mark 15', @ch=15, @verses=47, @bkId=341000000
EXEC add_Chapter @id=341016000, @code='mark-16', @ref='Mark 16', @ch=16, @verses=20, @bkId=341000000, @bkEnd=1
EXEC add_Chapter @id=342001000, @code='luke-1', @ref='Luke 1', @ch=1, @verses=80, @bkId=342000000
EXEC add_Chapter @id=342002000, @code='luke-2', @ref='Luke 2', @ch=2, @verses=52, @bkId=342000000
EXEC add_Chapter @id=342003000, @code='luke-3', @ref='Luke 3', @ch=3, @verses=38, @bkId=342000000
EXEC add_Chapter @id=342004000, @code='luke-4', @ref='Luke 4', @ch=4, @verses=44, @bkId=342000000
EXEC add_Chapter @id=342005000, @code='luke-5', @ref='Luke 5', @ch=5, @verses=39, @bkId=342000000
EXEC add_Chapter @id=342006000, @code='luke-6', @ref='Luke 6', @ch=6, @verses=49, @bkId=342000000
EXEC add_Chapter @id=342007000, @code='luke-7', @ref='Luke 7', @ch=7, @verses=50, @bkId=342000000
EXEC add_Chapter @id=342008000, @code='luke-8', @ref='Luke 8', @ch=8, @verses=56, @bkId=342000000
EXEC add_Chapter @id=342009000, @code='luke-9', @ref='Luke 9', @ch=9, @verses=62, @bkId=342000000
EXEC add_Chapter @id=342010000, @code='luke-10', @ref='Luke 10', @ch=10, @verses=42, @bkId=342000000
EXEC add_Chapter @id=342011000, @code='luke-11', @ref='Luke 11', @ch=11, @verses=54, @bkId=342000000
EXEC add_Chapter @id=342012000, @code='luke-12', @ref='Luke 12', @ch=12, @verses=59, @bkId=342000000
EXEC add_Chapter @id=342013000, @code='luke-13', @ref='Luke 13', @ch=13, @verses=35, @bkId=342000000
EXEC add_Chapter @id=342014000, @code='luke-14', @ref='Luke 14', @ch=14, @verses=35, @bkId=342000000
EXEC add_Chapter @id=342015000, @code='luke-15', @ref='Luke 15', @ch=15, @verses=32, @bkId=342000000
EXEC add_Chapter @id=342016000, @code='luke-16', @ref='Luke 16', @ch=16, @verses=31, @bkId=342000000
EXEC add_Chapter @id=342017000, @code='luke-17', @ref='Luke 17', @ch=17, @verses=37, @bkId=342000000
EXEC add_Chapter @id=342018000, @code='luke-18', @ref='Luke 18', @ch=18, @verses=43, @bkId=342000000
EXEC add_Chapter @id=342019000, @code='luke-19', @ref='Luke 19', @ch=19, @verses=48, @bkId=342000000
EXEC add_Chapter @id=342020000, @code='luke-20', @ref='Luke 20', @ch=20, @verses=47, @bkId=342000000
EXEC add_Chapter @id=342021000, @code='luke-21', @ref='Luke 21', @ch=21, @verses=38, @bkId=342000000
EXEC add_Chapter @id=342022000, @code='luke-22', @ref='Luke 22', @ch=22, @verses=71, @bkId=342000000
EXEC add_Chapter @id=342023000, @code='luke-23', @ref='Luke 23', @ch=23, @verses=56, @bkId=342000000
EXEC add_Chapter @id=342024000, @code='luke-24', @ref='Luke 24', @ch=24, @verses=53, @bkId=342000000, @bkEnd=1
EXEC add_Chapter @id=343001000, @code='john-1', @ref='John 1', @ch=1, @verses=51, @bkId=343000000
EXEC add_Chapter @id=343002000, @code='john-2', @ref='John 2', @ch=2, @verses=25, @bkId=343000000
EXEC add_Chapter @id=343003000, @code='john-3', @ref='John 3', @ch=3, @verses=36, @bkId=343000000
EXEC add_Chapter @id=343004000, @code='john-4', @ref='John 4', @ch=4, @verses=54, @bkId=343000000
EXEC add_Chapter @id=343005000, @code='john-5', @ref='John 5', @ch=5, @verses=47, @bkId=343000000
EXEC add_Chapter @id=343006000, @code='john-6', @ref='John 6', @ch=6, @verses=71, @bkId=343000000
EXEC add_Chapter @id=343007000, @code='john-7', @ref='John 7', @ch=7, @verses=53, @bkId=343000000
EXEC add_Chapter @id=343008000, @code='john-8', @ref='John 8', @ch=8, @verses=59, @bkId=343000000
EXEC add_Chapter @id=343009000, @code='john-9', @ref='John 9', @ch=9, @verses=41, @bkId=343000000
EXEC add_Chapter @id=343010000, @code='john-10', @ref='John 10', @ch=10, @verses=42, @bkId=343000000
EXEC add_Chapter @id=343011000, @code='john-11', @ref='John 11', @ch=11, @verses=57, @bkId=343000000
EXEC add_Chapter @id=343012000, @code='john-12', @ref='John 12', @ch=12, @verses=50, @bkId=343000000
EXEC add_Chapter @id=343013000, @code='john-13', @ref='John 13', @ch=13, @verses=38, @bkId=343000000
EXEC add_Chapter @id=343014000, @code='john-14', @ref='John 14', @ch=14, @verses=31, @bkId=343000000
EXEC add_Chapter @id=343015000, @code='john-15', @ref='John 15', @ch=15, @verses=27, @bkId=343000000
EXEC add_Chapter @id=343016000, @code='john-16', @ref='John 16', @ch=16, @verses=33, @bkId=343000000
EXEC add_Chapter @id=343017000, @code='john-17', @ref='John 17', @ch=17, @verses=26, @bkId=343000000
EXEC add_Chapter @id=343018000, @code='john-18', @ref='John 18', @ch=18, @verses=40, @bkId=343000000
EXEC add_Chapter @id=343019000, @code='john-19', @ref='John 19', @ch=19, @verses=42, @bkId=343000000
EXEC add_Chapter @id=343020000, @code='john-20', @ref='John 20', @ch=20, @verses=31, @bkId=343000000
EXEC add_Chapter @id=343021000, @code='john-21', @ref='John 21', @ch=21, @verses=25, @bkId=343000000, @bkEnd=1
EXEC add_Chapter @id=344001000, @code='acts-1', @ref='Acts 1', @ch=1, @verses=26, @bkId=344000000
EXEC add_Chapter @id=344002000, @code='acts-2', @ref='Acts 2', @ch=2, @verses=47, @bkId=344000000
EXEC add_Chapter @id=344003000, @code='acts-3', @ref='Acts 3', @ch=3, @verses=26, @bkId=344000000
EXEC add_Chapter @id=344004000, @code='acts-4', @ref='Acts 4', @ch=4, @verses=37, @bkId=344000000
EXEC add_Chapter @id=344005000, @code='acts-5', @ref='Acts 5', @ch=5, @verses=42, @bkId=344000000
EXEC add_Chapter @id=344006000, @code='acts-6', @ref='Acts 6', @ch=6, @verses=15, @bkId=344000000
EXEC add_Chapter @id=344007000, @code='acts-7', @ref='Acts 7', @ch=7, @verses=60, @bkId=344000000
EXEC add_Chapter @id=344008000, @code='acts-8', @ref='Acts 8', @ch=8, @verses=40, @bkId=344000000
EXEC add_Chapter @id=344009000, @code='acts-9', @ref='Acts 9', @ch=9, @verses=43, @bkId=344000000
EXEC add_Chapter @id=344010000, @code='acts-10', @ref='Acts 10', @ch=10, @verses=48, @bkId=344000000
EXEC add_Chapter @id=344011000, @code='acts-11', @ref='Acts 11', @ch=11, @verses=30, @bkId=344000000
EXEC add_Chapter @id=344012000, @code='acts-12', @ref='Acts 12', @ch=12, @verses=25, @bkId=344000000
EXEC add_Chapter @id=344013000, @code='acts-13', @ref='Acts 13', @ch=13, @verses=52, @bkId=344000000
EXEC add_Chapter @id=344014000, @code='acts-14', @ref='Acts 14', @ch=14, @verses=28, @bkId=344000000
EXEC add_Chapter @id=344015000, @code='acts-15', @ref='Acts 15', @ch=15, @verses=41, @bkId=344000000
EXEC add_Chapter @id=344016000, @code='acts-16', @ref='Acts 16', @ch=16, @verses=40, @bkId=344000000
EXEC add_Chapter @id=344017000, @code='acts-17', @ref='Acts 17', @ch=17, @verses=34, @bkId=344000000
EXEC add_Chapter @id=344018000, @code='acts-18', @ref='Acts 18', @ch=18, @verses=28, @bkId=344000000
EXEC add_Chapter @id=344019000, @code='acts-19', @ref='Acts 19', @ch=19, @verses=41, @bkId=344000000
EXEC add_Chapter @id=344020000, @code='acts-20', @ref='Acts 20', @ch=20, @verses=38, @bkId=344000000
EXEC add_Chapter @id=344021000, @code='acts-21', @ref='Acts 21', @ch=21, @verses=40, @bkId=344000000
EXEC add_Chapter @id=344022000, @code='acts-22', @ref='Acts 22', @ch=22, @verses=30, @bkId=344000000
EXEC add_Chapter @id=344023000, @code='acts-23', @ref='Acts 23', @ch=23, @verses=35, @bkId=344000000
EXEC add_Chapter @id=344024000, @code='acts-24', @ref='Acts 24', @ch=24, @verses=27, @bkId=344000000
EXEC add_Chapter @id=344025000, @code='acts-25', @ref='Acts 25', @ch=25, @verses=27, @bkId=344000000
EXEC add_Chapter @id=344026000, @code='acts-26', @ref='Acts 26', @ch=26, @verses=32, @bkId=344000000
EXEC add_Chapter @id=344027000, @code='acts-27', @ref='Acts 27', @ch=27, @verses=44, @bkId=344000000
EXEC add_Chapter @id=344028000, @code='acts-28', @ref='Acts 28', @ch=28, @verses=31, @bkId=344000000, @bkEnd=1
EXEC add_Chapter @id=345001000, @code='rom-1', @ref='Rom 1', @ch=1, @verses=32, @bkId=345000000
EXEC add_Chapter @id=345002000, @code='rom-2', @ref='Rom 2', @ch=2, @verses=29, @bkId=345000000
EXEC add_Chapter @id=345003000, @code='rom-3', @ref='Rom 3', @ch=3, @verses=31, @bkId=345000000
EXEC add_Chapter @id=345004000, @code='rom-4', @ref='Rom 4', @ch=4, @verses=25, @bkId=345000000
EXEC add_Chapter @id=345005000, @code='rom-5', @ref='Rom 5', @ch=5, @verses=21, @bkId=345000000
EXEC add_Chapter @id=345006000, @code='rom-6', @ref='Rom 6', @ch=6, @verses=23, @bkId=345000000
EXEC add_Chapter @id=345007000, @code='rom-7', @ref='Rom 7', @ch=7, @verses=25, @bkId=345000000
EXEC add_Chapter @id=345008000, @code='rom-8', @ref='Rom 8', @ch=8, @verses=39, @bkId=345000000
EXEC add_Chapter @id=345009000, @code='rom-9', @ref='Rom 9', @ch=9, @verses=33, @bkId=345000000
EXEC add_Chapter @id=345010000, @code='rom-10', @ref='Rom 10', @ch=10, @verses=21, @bkId=345000000
EXEC add_Chapter @id=345011000, @code='rom-11', @ref='Rom 11', @ch=11, @verses=36, @bkId=345000000
EXEC add_Chapter @id=345012000, @code='rom-12', @ref='Rom 12', @ch=12, @verses=21, @bkId=345000000
EXEC add_Chapter @id=345013000, @code='rom-13', @ref='Rom 13', @ch=13, @verses=14, @bkId=345000000
EXEC add_Chapter @id=345014000, @code='rom-14', @ref='Rom 14', @ch=14, @verses=26, @bkId=345000000
EXEC add_Chapter @id=345015000, @code='rom-15', @ref='Rom 15', @ch=15, @verses=33, @bkId=345000000
EXEC add_Chapter @id=345016000, @code='rom-16', @ref='Rom 16', @ch=16, @verses=27, @bkId=345000000, @bkEnd=1
EXEC add_Chapter @id=346001000, @code='1co-1', @ref='1Co 1', @ch=1, @verses=31, @bkId=346000000
EXEC add_Chapter @id=346002000, @code='1co-2', @ref='1Co 2', @ch=2, @verses=16, @bkId=346000000
EXEC add_Chapter @id=346003000, @code='1co-3', @ref='1Co 3', @ch=3, @verses=23, @bkId=346000000
EXEC add_Chapter @id=346004000, @code='1co-4', @ref='1Co 4', @ch=4, @verses=21, @bkId=346000000
EXEC add_Chapter @id=346005000, @code='1co-5', @ref='1Co 5', @ch=5, @verses=13, @bkId=346000000
EXEC add_Chapter @id=346006000, @code='1co-6', @ref='1Co 6', @ch=6, @verses=20, @bkId=346000000
EXEC add_Chapter @id=346007000, @code='1co-7', @ref='1Co 7', @ch=7, @verses=40, @bkId=346000000
EXEC add_Chapter @id=346008000, @code='1co-8', @ref='1Co 8', @ch=8, @verses=13, @bkId=346000000
EXEC add_Chapter @id=346009000, @code='1co-9', @ref='1Co 9', @ch=9, @verses=27, @bkId=346000000
EXEC add_Chapter @id=346010000, @code='1co-10', @ref='1Co 10', @ch=10, @verses=33, @bkId=346000000
EXEC add_Chapter @id=346011000, @code='1co-11', @ref='1Co 11', @ch=11, @verses=34, @bkId=346000000
EXEC add_Chapter @id=346012000, @code='1co-12', @ref='1Co 12', @ch=12, @verses=31, @bkId=346000000
EXEC add_Chapter @id=346013000, @code='1co-13', @ref='1Co 13', @ch=13, @verses=13, @bkId=346000000
EXEC add_Chapter @id=346014000, @code='1co-14', @ref='1Co 14', @ch=14, @verses=40, @bkId=346000000
EXEC add_Chapter @id=346015000, @code='1co-15', @ref='1Co 15', @ch=15, @verses=58, @bkId=346000000
EXEC add_Chapter @id=346016000, @code='1co-16', @ref='1Co 16', @ch=16, @verses=24, @bkId=346000000, @bkEnd=1
EXEC add_Chapter @id=347001000, @code='2co-1', @ref='2Co 1', @ch=1, @verses=24, @bkId=347000000
EXEC add_Chapter @id=347002000, @code='2co-2', @ref='2Co 2', @ch=2, @verses=17, @bkId=347000000
EXEC add_Chapter @id=347003000, @code='2co-3', @ref='2Co 3', @ch=3, @verses=18, @bkId=347000000
EXEC add_Chapter @id=347004000, @code='2co-4', @ref='2Co 4', @ch=4, @verses=18, @bkId=347000000
EXEC add_Chapter @id=347005000, @code='2co-5', @ref='2Co 5', @ch=5, @verses=21, @bkId=347000000
EXEC add_Chapter @id=347006000, @code='2co-6', @ref='2Co 6', @ch=6, @verses=18, @bkId=347000000
EXEC add_Chapter @id=347007000, @code='2co-7', @ref='2Co 7', @ch=7, @verses=16, @bkId=347000000
EXEC add_Chapter @id=347008000, @code='2co-8', @ref='2Co 8', @ch=8, @verses=24, @bkId=347000000
EXEC add_Chapter @id=347009000, @code='2co-9', @ref='2Co 9', @ch=9, @verses=15, @bkId=347000000
EXEC add_Chapter @id=347010000, @code='2co-10', @ref='2Co 10', @ch=10, @verses=18, @bkId=347000000
EXEC add_Chapter @id=347011000, @code='2co-11', @ref='2Co 11', @ch=11, @verses=33, @bkId=347000000
EXEC add_Chapter @id=347012000, @code='2co-12', @ref='2Co 12', @ch=12, @verses=21, @bkId=347000000
EXEC add_Chapter @id=347013000, @code='2co-13', @ref='2Co 13', @ch=13, @verses=14, @bkId=347000000, @bkEnd=1
EXEC add_Chapter @id=348001000, @code='gal-1', @ref='Gal 1', @ch=1, @verses=24, @bkId=348000000
EXEC add_Chapter @id=348002000, @code='gal-2', @ref='Gal 2', @ch=2, @verses=21, @bkId=348000000
EXEC add_Chapter @id=348003000, @code='gal-3', @ref='Gal 3', @ch=3, @verses=29, @bkId=348000000
EXEC add_Chapter @id=348004000, @code='gal-4', @ref='Gal 4', @ch=4, @verses=31, @bkId=348000000
EXEC add_Chapter @id=348005000, @code='gal-5', @ref='Gal 5', @ch=5, @verses=26, @bkId=348000000
EXEC add_Chapter @id=348006000, @code='gal-6', @ref='Gal 6', @ch=6, @verses=18, @bkId=348000000, @bkEnd=1
EXEC add_Chapter @id=349001000, @code='eph-1', @ref='Eph 1', @ch=1, @verses=23, @bkId=349000000
EXEC add_Chapter @id=349002000, @code='eph-2', @ref='Eph 2', @ch=2, @verses=22, @bkId=349000000
EXEC add_Chapter @id=349003000, @code='eph-3', @ref='Eph 3', @ch=3, @verses=21, @bkId=349000000
EXEC add_Chapter @id=349004000, @code='eph-4', @ref='Eph 4', @ch=4, @verses=32, @bkId=349000000
EXEC add_Chapter @id=349005000, @code='eph-5', @ref='Eph 5', @ch=5, @verses=33, @bkId=349000000
EXEC add_Chapter @id=349006000, @code='eph-6', @ref='Eph 6', @ch=6, @verses=24, @bkId=349000000, @bkEnd=1
EXEC add_Chapter @id=350001000, @code='php-1', @ref='Php 1', @ch=1, @verses=30, @bkId=350000000
EXEC add_Chapter @id=350002000, @code='php-2', @ref='Php 2', @ch=2, @verses=30, @bkId=350000000
EXEC add_Chapter @id=350003000, @code='php-3', @ref='Php 3', @ch=3, @verses=21, @bkId=350000000
EXEC add_Chapter @id=350004000, @code='php-4', @ref='Php 4', @ch=4, @verses=23, @bkId=350000000, @bkEnd=1
EXEC add_Chapter @id=351001000, @code='col-1', @ref='Col 1', @ch=1, @verses=29, @bkId=351000000
EXEC add_Chapter @id=351002000, @code='col-2', @ref='Col 2', @ch=2, @verses=23, @bkId=351000000
EXEC add_Chapter @id=351003000, @code='col-3', @ref='Col 3', @ch=3, @verses=25, @bkId=351000000
EXEC add_Chapter @id=351004000, @code='col-4', @ref='Col 4', @ch=4, @verses=18, @bkId=351000000, @bkEnd=1
EXEC add_Chapter @id=352001000, @code='1th-1', @ref='1Th 1', @ch=1, @verses=10, @bkId=352000000
EXEC add_Chapter @id=352002000, @code='1th-2', @ref='1Th 2', @ch=2, @verses=20, @bkId=352000000
EXEC add_Chapter @id=352003000, @code='1th-3', @ref='1Th 3', @ch=3, @verses=13, @bkId=352000000
EXEC add_Chapter @id=352004000, @code='1th-4', @ref='1Th 4', @ch=4, @verses=18, @bkId=352000000
EXEC add_Chapter @id=352005000, @code='1th-5', @ref='1Th 5', @ch=5, @verses=28, @bkId=352000000, @bkEnd=1
EXEC add_Chapter @id=353001000, @code='2th-1', @ref='2Th 1', @ch=1, @verses=12, @bkId=353000000
EXEC add_Chapter @id=353002000, @code='2th-2', @ref='2Th 2', @ch=2, @verses=17, @bkId=353000000
EXEC add_Chapter @id=353003000, @code='2th-3', @ref='2Th 3', @ch=3, @verses=18, @bkId=353000000, @bkEnd=1
EXEC add_Chapter @id=354001000, @code='1tim-1', @ref='1Tim 1', @ch=1, @verses=20, @bkId=354000000
EXEC add_Chapter @id=354002000, @code='1tim-2', @ref='1Tim 2', @ch=2, @verses=15, @bkId=354000000
EXEC add_Chapter @id=354003000, @code='1tim-3', @ref='1Tim 3', @ch=3, @verses=16, @bkId=354000000
EXEC add_Chapter @id=354004000, @code='1tim-4', @ref='1Tim 4', @ch=4, @verses=16, @bkId=354000000
EXEC add_Chapter @id=354005000, @code='1tim-5', @ref='1Tim 5', @ch=5, @verses=25, @bkId=354000000
EXEC add_Chapter @id=354006000, @code='1tim-6', @ref='1Tim 6', @ch=6, @verses=21, @bkId=354000000, @bkEnd=1
EXEC add_Chapter @id=355001000, @code='2tim-1', @ref='2Tim 1', @ch=1, @verses=18, @bkId=355000000
EXEC add_Chapter @id=355002000, @code='2tim-2', @ref='2Tim 2', @ch=2, @verses=26, @bkId=355000000
EXEC add_Chapter @id=355003000, @code='2tim-3', @ref='2Tim 3', @ch=3, @verses=17, @bkId=355000000
EXEC add_Chapter @id=355004000, @code='2tim-4', @ref='2Tim 4', @ch=4, @verses=22, @bkId=355000000, @bkEnd=1
EXEC add_Chapter @id=356001000, @code='Titus-1', @ref='Titus 1', @ch=1, @verses=16, @bkId=356000000
EXEC add_Chapter @id=356002000, @code='Titus-2', @ref='Titus 2', @ch=2, @verses=15, @bkId=356000000
EXEC add_Chapter @id=356003000, @code='Titus-3', @ref='Titus 3', @ch=3, @verses=15, @bkId=356000000, @bkEnd=1
EXEC add_Chapter @id=357001000, @code='phlm-1', @ref='Phlm 1', @ch=1, @verses=25, @bkId=357000000, @bkEnd=1
EXEC add_Chapter @id=358001000, @code='heb-1', @ref='Heb 1', @ch=1, @verses=14, @bkId=358000000
EXEC add_Chapter @id=358002000, @code='heb-2', @ref='Heb 2', @ch=2, @verses=18, @bkId=358000000
EXEC add_Chapter @id=358003000, @code='heb-3', @ref='Heb 3', @ch=3, @verses=19, @bkId=358000000
EXEC add_Chapter @id=358004000, @code='heb-4', @ref='Heb 4', @ch=4, @verses=16, @bkId=358000000
EXEC add_Chapter @id=358005000, @code='heb-5', @ref='Heb 5', @ch=5, @verses=14, @bkId=358000000
EXEC add_Chapter @id=358006000, @code='heb-6', @ref='Heb 6', @ch=6, @verses=20, @bkId=358000000
EXEC add_Chapter @id=358007000, @code='heb-7', @ref='Heb 7', @ch=7, @verses=28, @bkId=358000000
EXEC add_Chapter @id=358008000, @code='heb-8', @ref='Heb 8', @ch=8, @verses=13, @bkId=358000000
EXEC add_Chapter @id=358009000, @code='heb-9', @ref='Heb 9', @ch=9, @verses=28, @bkId=358000000
EXEC add_Chapter @id=358010000, @code='heb-10', @ref='Heb 10', @ch=10, @verses=39, @bkId=358000000
EXEC add_Chapter @id=358011000, @code='heb-11', @ref='Heb 11', @ch=11, @verses=40, @bkId=358000000
EXEC add_Chapter @id=358012000, @code='heb-12', @ref='Heb 12', @ch=12, @verses=29, @bkId=358000000
EXEC add_Chapter @id=358013000, @code='heb-13', @ref='Heb 13', @ch=13, @verses=25, @bkId=358000000, @bkEnd=1
EXEC add_Chapter @id=359001000, @code='james-1', @ref='James 1', @ch=1, @verses=27, @bkId=359000000
EXEC add_Chapter @id=359002000, @code='james-2', @ref='James 2', @ch=2, @verses=26, @bkId=359000000
EXEC add_Chapter @id=359003000, @code='james-3', @ref='James 3', @ch=3, @verses=18, @bkId=359000000
EXEC add_Chapter @id=359004000, @code='james-4', @ref='James 4', @ch=4, @verses=17, @bkId=359000000
EXEC add_Chapter @id=359005000, @code='james-5', @ref='James 5', @ch=5, @verses=20, @bkId=359000000, @bkEnd=1
EXEC add_Chapter @id=360001000, @code='1pe-1', @ref='1Pe 1', @ch=1, @verses=25, @bkId=360000000
EXEC add_Chapter @id=360002000, @code='1pe-2', @ref='1Pe 2', @ch=2, @verses=25, @bkId=360000000
EXEC add_Chapter @id=360003000, @code='1pe-3', @ref='1Pe 3', @ch=3, @verses=22, @bkId=360000000
EXEC add_Chapter @id=360004000, @code='1pe-4', @ref='1Pe 4', @ch=4, @verses=19, @bkId=360000000
EXEC add_Chapter @id=360005000, @code='1pe-5', @ref='1Pe 5', @ch=5, @verses=14, @bkId=360000000, @bkEnd=1
EXEC add_Chapter @id=361001000, @code='2pe-1', @ref='2Pe 1', @ch=1, @verses=21, @bkId=361000000
EXEC add_Chapter @id=361002000, @code='2pe-2', @ref='2Pe 2', @ch=2, @verses=22, @bkId=361000000
EXEC add_Chapter @id=361003000, @code='2pe-3', @ref='2Pe 3', @ch=3, @verses=18, @bkId=361000000, @bkEnd=1
EXEC add_Chapter @id=362001000, @code='1john-1', @ref='1John 1', @ch=1, @verses=10, @bkId=362000000
EXEC add_Chapter @id=362002000, @code='1john-2', @ref='1John 2', @ch=2, @verses=29, @bkId=362000000
EXEC add_Chapter @id=362003000, @code='1john-3', @ref='1John 3', @ch=3, @verses=24, @bkId=362000000
EXEC add_Chapter @id=362004000, @code='1john-4', @ref='1John 4', @ch=4, @verses=21, @bkId=362000000
EXEC add_Chapter @id=362005000, @code='1john-5', @ref='1John 5', @ch=5, @verses=21, @bkId=362000000, @bkEnd=1
EXEC add_Chapter @id=363001000, @code='2john-1', @ref='2John 1', @ch=1, @verses=13, @bkId=363000000, @bkEnd=1
EXEC add_Chapter @id=364001000, @code='3john-1', @ref='3John 1', @ch=1, @verses=15, @bkId=364000000, @bkEnd=1
EXEC add_Chapter @id=365001000, @code='jude-1', @ref='Jude 1', @ch=1, @verses=25, @bkId=365000000, @bkEnd=1
EXEC add_Chapter @id=366001000, @code='rev-1', @ref='Rev 1', @ch=1, @verses=20, @bkId=366000000
EXEC add_Chapter @id=366002000, @code='rev-2', @ref='Rev 2', @ch=2, @verses=29, @bkId=366000000
EXEC add_Chapter @id=366003000, @code='rev-3', @ref='Rev 3', @ch=3, @verses=22, @bkId=366000000
EXEC add_Chapter @id=366004000, @code='rev-4', @ref='Rev 4', @ch=4, @verses=11, @bkId=366000000
EXEC add_Chapter @id=366005000, @code='rev-5', @ref='Rev 5', @ch=5, @verses=14, @bkId=366000000
EXEC add_Chapter @id=366006000, @code='rev-6', @ref='Rev 6', @ch=6, @verses=17, @bkId=366000000
EXEC add_Chapter @id=366007000, @code='rev-7', @ref='Rev 7', @ch=7, @verses=17, @bkId=366000000
EXEC add_Chapter @id=366008000, @code='rev-8', @ref='Rev 8', @ch=8, @verses=13, @bkId=366000000
EXEC add_Chapter @id=366009000, @code='rev-9', @ref='Rev 9', @ch=9, @verses=21, @bkId=366000000
EXEC add_Chapter @id=366010000, @code='rev-10', @ref='Rev 10', @ch=10, @verses=11, @bkId=366000000
EXEC add_Chapter @id=366011000, @code='rev-11', @ref='Rev 11', @ch=11, @verses=19, @bkId=366000000
EXEC add_Chapter @id=366012000, @code='rev-12', @ref='Rev 12', @ch=12, @verses=17, @bkId=366000000
EXEC add_Chapter @id=366013000, @code='rev-13', @ref='Rev 13', @ch=13, @verses=18, @bkId=366000000
EXEC add_Chapter @id=366014000, @code='rev-14', @ref='Rev 14', @ch=14, @verses=20, @bkId=366000000
EXEC add_Chapter @id=366015000, @code='rev-15', @ref='Rev 15', @ch=15, @verses=8, @bkId=366000000
EXEC add_Chapter @id=366016000, @code='rev-16', @ref='Rev 16', @ch=16, @verses=21, @bkId=366000000
EXEC add_Chapter @id=366017000, @code='rev-17', @ref='Rev 17', @ch=17, @verses=18, @bkId=366000000
EXEC add_Chapter @id=366018000, @code='rev-18', @ref='Rev 18', @ch=18, @verses=24, @bkId=366000000
EXEC add_Chapter @id=366019000, @code='rev-19', @ref='Rev 19', @ch=19, @verses=21, @bkId=366000000
EXEC add_Chapter @id=366020000, @code='rev-20', @ref='Rev 20', @ch=20, @verses=15, @bkId=366000000
EXEC add_Chapter @id=366021000, @code='rev-21', @ref='Rev 21', @ch=21, @verses=27, @bkId=366000000
EXEC add_Chapter @id=366022000, @code='rev-22', @ref='Rev 22', @ch=22, @verses=21, @bkId=366000000, @bkEnd=1
