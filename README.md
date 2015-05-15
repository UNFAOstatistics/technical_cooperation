Technical Cooperation Group
========================================


Etherpad - for collaborative text editing
----------------------------------------

>Etherpad is a highly customizable Open Source online editor providing collaborative editing in really real-time.

- <http://etherpad.org/>
- Could be hosted internally <https://github.com/ether/etherpad-lite#installation>
- Sites providing hosting:
    - [Open Knowledge](https://okfn.org/) at: <https://pad.okfn.org/>
    - [RiseUp](https://help.riseup.net/) at : <https://help.riseup.net/>
- Allows
    - real-time online collaboration with no registration what-so-ever
    - create new document by typing it name
    - version history
    - export for post-processing for Word doc, website, latex pdf
- User examples
    - [pdf commenting in team F](http://koti.kapsi.fi/~muuankarski/fao/GSPB15/comment.html)
- FAO demo: <https://pad.okfn.org/p/faodemo-main>


### Processing the text from etherpad with Pandoc

- [Pandoc a universal document converter](http://pandoc.org/)

    # Download file
    curl -k -o docs/input.md https://pad.okfn.org/p/faodemo-main/export/txt
    # Convert in different formats
    pandoc docs/input.md -o docs/output.pdf
    pandoc docs/input.md -o docs/output.docx
    pandoc docs/input.md -o docs/output.odt
    pandoc docs/input.md -o docs/output.html

See the input & outputs in `docs/`-folder


Something else
----------------------------------------