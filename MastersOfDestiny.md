# Masters of Destiny

some dependency inducing neural network on a server somewhere."

TWIDDLE-DEE? More like Twiddle Dumb, I thought.  But this was going way
over my simpleton head, "Ah...and how is this better than, I don't know,
something archaic, say a textbook?"

Waq's face clouded over, "Well it will have a Cloud, be Digital, Dynamic,
and Deterministic."

"Did you ask ChatGPT to come up with this?"

Waq realised how easily he had fallen fell into the trap created by
an AI that was not above subterfuge in the guise of being helpful. 

"It's ok, Waq.", I consoled him, "This is exactly why you should watch
80s Sci Fi on  VHS tapes instead of adding to the training dataset of
those silicon cybernetic systems planning to take over the world."

"It's too late, isn't it?"

I would have patted him on his shoulder if I could have reached it. But
an idea struck me. There is another kind of cloud that could be useful.
"The future is not set, Waq." I said, "You'll be back."

## Interactive Word Cloud

Examples of Word Cloud Generators abound on-line. While useful for one off
projects and presentations, for flexible and easily configurable it is
handy to have a module for your own language of choice.  MetaCPAN has a
couple of options. [c0bra(Brian Hann)](https://github.com/c0bra) created
[Image::WordCloud](https://metacpan.org/pod/Image::WordCloud) to generate
raster Word Cloud Images. It is rather clever, depends on SDL to determine
the dimensions of a word to create a attractive word cloud. 
[Sarah Roberts](https://metacpan.org/author/ROBERTSD) created
[HTML::TagCloud](https://metacpan.org/pod/HTML::TagCloud) to generate HTML
Tags. 

![image](https://github.com/saiftynet/dummyrepo/blob/main/CloudElement/textcloudhtm.png)

I am developing yet another option, this time using addressable elements
to generate Word Clouds in svg and html.  This potentially allows dynamic
manipulation and interaction with the cloud.  One possible goal is to
develop a deterministic tree connecting multiple such word clouds as part
of an expert system.

My early effort is [CloudElement](https://github.com/saiftynet/CloudElement/)
