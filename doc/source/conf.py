# -*- coding: utf-8 -*-
#
# clmdoc documentation build configuration file, created by
# sphinx-quickstart on Thu Feb 23 17:14:30 2017.
#
# This file is execfile()d with the current directory set to its
# containing dir.
#
# Note that not all possible configuration values are present in this
# autogenerated file.
#
# All configuration values have a default; values that are commented out
# serve to show the default.

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
import os
import sys
# Note that we need a specific version of sphinx_rtd_theme. This can be obtained with:
# pip install git+https://github.com/esmci/sphinx_rtd_theme.git@version-dropdown-with-fixes
import sphinx_rtd_theme
# sys.path.insert(0, os.path.abspath('.'))


# -- General configuration ------------------------------------------------

# If your documentation needs a minimal Sphinx version, state it here.
#
# needs_sphinx = '1.0'

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = ['sphinx.ext.intersphinx',
    'sphinx.ext.autodoc',
    'sphinx.ext.todo',
    'sphinx.ext.coverage',
    'sphinx.ext.githubpages']

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# The suffix(es) of source filenames.
# You can specify multiple suffix as a list of string:
#
source_suffix = ['.rst', '.md']
#source_suffix = '.rst'

# The master toctree document.
master_doc = 'index'

# General information about the project.
project = u'ctsm'
copyright = u'2020, UCAR'
author = u''

# The version info for the project you're documenting, acts as replacement for
# |version| and |release|, also used in various other places throughout the
# built documents.
#
# The short X.Y version.
version = u'CTSM1'
# The full version, including alpha/beta/rc tags.
release = u'CTSM master'
# CTSM-specific: version label used at the top of some pages.
version_label = 'the latest development code'

# version_label is not a standard sphinx variable, so we need some custom rst to allow
# pages to use it. We need a separate replacement for the bolded version because it
# doesn't work to have variable replacements within formatting.
rst_epilog = """
.. |version_label| replace:: {version_label}
.. |version_label_bold| replace:: **{version_label}**
""".format(version_label=version_label)

# The language for content autogenerated by Sphinx. Refer to documentation
# for a list of supported languages.
#
# This is also used if you do content translation via gettext catalogs.
# Usually you set "language" from the command line for these cases.
language = None

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This patterns also effect to html_static_path and html_extra_path
exclude_patterns = []

# The name of the Pygments (syntax highlighting) style to use.
pygments_style = 'sphinx'

# If true, `todo` and `todoList` produce output, else they produce nothing.
todo_include_todos = True

# -- Options for HTML output ----------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
html_theme = 'sphinx_rtd_theme'

# Theme options are theme-specific and customize the look and feel of a theme
# further.  For a list of options available for each theme, see the
# documentation.
#
# The 'versions' option needs to have at least two versions to work, but it doesn't need
# to have all versions: others will be added dynamically. Note that this maps from version
# names to html links. The current version can link to the current location (i.e., do
# nothing). For the other version, we just add a place-holder; its name and value are
# unimportant because these versions will get replaced dynamically.
html_theme_options = {}
html_theme_options['versions'] = {version: ''}
html_theme_options['versions']['[placeholder]'] = ''

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']


# -- Options for HTMLHelp output ------------------------------------------

# Output file base name for HTML help builder.
htmlhelp_basename = 'clmdocdoc'


# -- Options for LaTeX output ---------------------------------------------

latex_elements = {
    # The paper size ('letterpaper' or 'a4paper').
    #
    # 'papersize': 'letterpaper',

    # The font size ('10pt', '11pt' or '12pt').
    #
    # 'pointsize': '10pt',

    # Additional stuff for the LaTeX preamble.
    #
    'preamble': '\\usepackage{hyperref}',

    'fncychap': '\\usepackage[Conny]{fncychap}',

    # Latex figure (float) alignment
    #
    # 'figure_align': 'htbp',
}

# Grouping the document tree into LaTeX files. List of tuples
# (source start file, target name, title,
#  author, documentclass [howto, manual, or own class]).
latex_documents = [(master_doc, 'clmdoc.tex', u'CLM5 Documentation', '', 'manual'),]


# -- Options for manual page output ---------------------------------------

# One entry per manual page. List of tuples
# (source start file, name, description, authors, manual section).
man_pages = [
    (master_doc, 'clmdoc', u'clmdoc Documentation',
     [author], 1)
]


# -- Options for Texinfo output -------------------------------------------

# Grouping the document tree into Texinfo files. List of tuples
# (source start file, target name, title, author,
#  dir menu entry, description, category)
texinfo_documents = [
    (master_doc, 'clmdoc', u'clmdoc Documentation',
     author, 'clmdoc', 'One line description of project.',
     'Miscellaneous'),
]




# Example configuration for intersphinx: refer to the Python standard library.
intersphinx_mapping = {'https://docs.python.org/': None}

numfig = True
numfig_format = {'figure': 'Figure %s',
                 'table': 'Table %s',
                 'code-block': 'Code %s',
                 'section': '%s',
                }
numfig_secnum_depth = 2

def setup(app):
    app.add_css_file('css/custom.css')
