# Design Workshop

* [Design Thinking](#design-thinking)
* [Design Building](#design-building)
* [Responsive Web Design](#responsive-web-design)

## Your Tasks

### 1 - analyze
(30 mins)
In pairs, find 2 websites that you both really like (both
funtionality/content and visually) and answer the following questions:
**Functionality**
* What about this site is easy to use?
* Is the functionality the same on different devices, browsers, and
monitors sizes?
* Where is the navigation? Is it clear?
* How do you login and sign up? Do the links stand out?

**Visual**
* What do you like about the site visually?
* What are the colors for: background, text, links, headers, navigation,
primary/pop color
* What are the fonts and sizes for: text, links, headers, navigation,
buttons
* When you take a step back what stands out?
* Where is the first place your eyes look?
* How many clicks/pages before you get to what you want to do?

**Code**
Using the inspector, take a look at the code.
* Is it organized well?
* Is it using semantic HTML5?
* How are the CSS classes named?

### 2 - wireframe & styleguide
(30 mins)
* Using wireframing software, such as
[Mockingbird](https://gomockingbird.com/), or pen and paper, create a
wireframe of the site.
* Create a visual styleguide for the site, containing:
  - colors used (background, text, primary, links, buttons, headers)
  - fonts and font sizes
  - grid
  - navigation
  - any elements re-used multiple times (i.e. buttons, facebook post
box, etc)

### 3 - tell us
(30 mins)
Give a lightning talk about:
* your analysis of the site
* showing your wireframe and styleguide

### 4 - with Rails
(1 hr)
Create a simple CRUD app in rails with a single model
with a single field. It should only have add/create and index
actions.

Your view HTML should ONLY contain:
- a form with single text input and button (add/create)
- a list with 2 elements (span, p, div ONLY)

Using your wireframe and styleguide, implement the CSS in your Rails
app.

You may:
- use SCSS
- add 1-3 CSS classes to each of your elements
- add a class to the body based on controller/action
- modify the application layout to add headers and footers (using HTML5
tags)

### 5 - give yourself credit
(30 mins)
Add a "callout box" to every page of your site that matches the style of
your site, but is visually prominent.

Use a partial with basic HTML and CSS.

### 6 - present
(30 mins)
Present your site and tell us about your challenges and aha moments.


<hr>

## Design Thinking

### Objectives

- Plan out content and functions -> pages, UI features, flow
- Map content elements to HTML elements
- Determine what rules the elements need to follow for the desired layout
- Implement rules via CSS
- Embrace a certain amount of trial-and-error process ([visual representation](http://imgur.com/Q3cUg29))

### Wireframes

Wireframes visually map out 1) what elements you need and 2) what those elements should be doing.

- [Why Wireframe](http://zurb.com/article/596/why-wireframe)
- [20 Steps to Better Wireframing](http://blog.teamtreehouse.com/20-steps-to-better-wireframing)
- [A Beginner's Guide to Wireframing](http://webdesign.tutsplus.com/tutorials/workflow-tutorials/a-beginners-guide-to-wireframing/)
- [Wireframe.cc](https://wireframe.cc/)

### Inspiration

Find examples of solutions for problems similiar to yours and learn how to engineer them.

- [Pattern Tap](http://patterntap.com/)
- [Unmatched Style](http://unmatchedstyle.com/)

### CSS Organization

Explore different ways of organizing your CSS.

- [Code Guide by @mdo](http://mdo.github.io/code-guide/)
- [Front-End Legos](https://speakerdeck.com/shayhowe/modular-html-and-css-workshop)
- [Object-Oriented CSS](https://github.com/stubbornella/oocss/wiki)
- [SMACSS (Scalable and Modular Architecture for CSS](http://smacss.com/book/)
- [Fuctional CSS](http://flippinawesome.org/2013/08/26/functional-css-fcss/)

## Design Building

- Working with Rails views.
- Using Sass.
- Choosing to use (or not) a CSS framework.
- Responsive design.

### Rails views

- Have a strong, semantic markup structure.
- Presentation (CSS) and behavior (JS) should be separate.
- Complex logic should be somewhere else.
- Partials are your friends.
- [The Rails View Rules](http://www.therailsview.com/rules.pdf)

### Sass

- CSS with superpowers
  - [Sass Basics](http://sass-lang.com/guide)
  - [Compass](http://compass-style.org/)
  - [Susy](http://susy.oddbird.net/)
  - [Bourbon](http://bourbon.io/)
  - [Neat](http://neat.bourbon.io/)

### Frameworks

- Things to consider about frameworks:
  - Do I know how this works?
  - Does this affect performance?
  - What's the cost of retroactive customization vs. building custom from scratch?
  - Will a smaller tool serve my purpose?


## Responsive Web Design

### Talk Notes

- The best way to learn responsive web design is to learn web design.
- Web design is necessarily dynamic because the web is essentially dynamic.
- How it works vs. what it looks like.
- Focus on content, hierarchy and actions.
- Style and form should emerge from content organization.

### Philosophy

- [If responsive design is completely turning your process upside down, then your process is wrong](http://jenmyers.tumblr.com/post/44856172501/if-responsive-design-is-completely-turning-your-process)
	- My rant on how to think about designing for the web.
- [Great Responsive Web Design is a Matter of Process](https://medium.com/p/270048a88c70)
	- "Design for content not for devices." An article by Jacey Gulden about creating a RWD workflow.
- [Responsive Web Design](http://alistapart.com/article/responsive-web-design)
	- The original article by Ethan Marcotte introducing the concept of RWD.

### Process

- [The Responsive Design Process](https://speakerdeck.com/jeremyloyd/the-responsive-design-process)
	- Slidedeck from Jeremy Lloyd of Sparkbox.
- [Sparkbox Responsive Design Process Infographic](http://webdesign.tutsplus.com/articles/workflow/the-sparkbox-responsive-design-process/)
- [7 Habits of Highly Effective Media Queries](http://bradfrostweb.com/blog/post/7-habits-of-highly-effective-media-queries/)

### Tools

- [CSS media queries@ MDN](https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Media_queries)
- [Media query bookmarklet](http://seesparkbox.com/foundry/media_query_bookmarklet)
- [Responsive design testing bookmarklet](http://responsive.victorcoulon.fr/)

### Reference

- [Common media query breakpoints](http://code-tricks.com/css-media-queries-for-common-devices/)
- [Mediaqueri.es](http://mediaqueri.es/)
	- A collection of sites that use media queries.
