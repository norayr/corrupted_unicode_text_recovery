![](dates.png)


so [git doesn't preserve file modification time](https://git.wiki.kernel.org/index.php/Git_FAQ#Why_isn.27t_Git_preserving_modification_time_on_files.3F) so i need to show you a screenshot.

back then i was sometimes getting letters corrupted like this:

```&#1089;&#1087;&#1072;&#1089;&#1080;&#1073;&#1086; &#1079;&#1072; &#1086;&#1090;&#1074;&#1077;&#1090;, &#1103; &#1090;&#1072;&#1082; &#1079;&#1072;&#1087;&#1091;&#1090;&#1072;&#1083;&#1072;&#1089;&#1100; &#1089; &#1089;&#1086;&#1073;&#1072;&#1082;&#1086;&#1081; &#1095;&#1090;&#1086; &#1085;&#1077; &#1079;&#1085;&#1072;&#1083;&#1072; &#1095;&#1090;&#1086; &#1076;&#1077;&#1083;&#1072;&#1090;&#1100;.```

and in order to not ask people to resend those, i wrote this, of course back then gui app, of course for windows, to convert it to legit unicode text.

i had a font in a program directory, so i keep it in this repo, though it's not a good practice.

this program is very simple, but today i'd implement it to read from stdin and output to stdout. and of course would separate to more modules.

may be will reimplement one day in different repo. (:
