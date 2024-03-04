Rule Description
================

Converts test results from a text file to a PDF report using Pandoc.

- **Conda Environment:** Specifies dependencies for the rule using the Conda environment defined in `"envs/txt_to_pdf.yaml"`.
- **Input:** Takes the test results from `"results"`.
- **Output:** Generates a PDF report of the input in `"results"`.
- **Shell Command:** Utilizes Pandoc to convert the text file to PDF format, using the Tectonic PDF engine for conversion.
