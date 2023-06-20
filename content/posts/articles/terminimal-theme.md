---
title: Terminimal Theme for Zola
date: 2019-02-04
draft: true
taxonomies:
  categories:
    - articles
  tags:
    - zola
    - theme
    - showcase
extra:
  featuredImg: images/petri-heiskanen-vqO_1fUCNxg-unsplash.jpg
---
Welcome to Terminimal! This is a theme showcase post.

Code block (using "boron" theme):

```python
#!/usr/bin/python3

class HelloPrinter:
    def __init__(self, thing):
        self.thing = thing
        
    def __call__(self):
        print(f"Hello, {self.thing}!")


printer = HelloPrinter("World")
printer()

# prints: Hello, World!
```

Inline code: `print("Hello world!")`.

Basic typography:

*Italic text*.  **Bold text**. _**Italic bold**_. Link: [click me](#)

# Header 1
## Header 2
### Header 3
#### Header 4

Quote:

> "Theory is when you know everything but nothing works.
Practice is when everything works but no one knows why.
In our lab, theory and practice are combined: nothing works and no one knows why."

Lists:

- A
- B
- CDEF
  - Nested Item
    - And more nesting
  - GHIJ


1. One
2. Two
3. Three

Horizontal line:

---

This is where the post summary ends.

<!-- more -->

The second part follows here.
