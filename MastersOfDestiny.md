# Masters of Destiny

It is an unfortunate fact of life reflected in the stages of man, that
we start off facing problems looking to others to solve these problems.
Later we learn to solve these problems ourselves, we teach others to do the
same.  After that we delegate problem solving to those we have taught,
and find that as our own capacity diminishes, those that come after us
simply ask an AI to do that which we struggled to learn in the past. A
steady spiral ensuring future humanity's cognitive decline, fueled by
the genius of its ancestors. We had become masters of our destiny
only to hand it over to machines, because we hope machines will do it
better.

In my job, tools that were created to make our job easier demand data
from us, enforce protocols and are the exclusive conduit for information.
Thus in our so called "caring profession", the modern doctor spends as
much time staring at a monitor as looking at patients, more hands on
keyboard than hands-on examination, relying more on scans than an
unreliable clinical acumen.  Indeed this future may be safer and it is
foolish to value old system of compassionate care delivery just because
dispassionate algorithms have dispensed with the need for a human touch. 

## Clouded Judgement

Enter one of newest colleagues, let's call him Waq.  A gentle giant of
a youth, who looked like he could beat you to a pulp with a cheerful handshake.
This big-brained surgeon whose head was always in the clouds, had
discovered LLMs residing in those clouds and wished to bring them to the
reach of the lesser mortals such as myself.

"I know what you need!" he announced. Of course I knew exactly what I
needed, and it didn't involve a smart-alec youth (even if he is 8 feet
tall, with arms the size of my thighs) telling me.

"Oh, hello Waq", I said putting on my well-practiced fake sincerity,
"I was just hoping you would come along and tell me."

Waq didn't need any encouragement, seeming to derive an unending suppply 
of enthusiasm from thin air, "You need A Cloud".

"Goodness, you're right!" I said, "A Cloud, you say? Lenticular or 
Cumulonimbus do you think?"

"You know how you hate AI, think it will take our jobs and end the world?"

"I have seen Terminator, Waq", I said "Of course I know what's coming.",
with visions of Waq revealing himself as a cyborg  with
living biomimetic skin grown over a metallic endoskeleton.

"A Two-Way Interface for a Dynamic Digital Learning Experience and 
Deterministic  Encoding of Expertise", he declared. "Now this will use
experts to encoding their knowledge, experience and available evidence in
a form that be used to train other individuals, rather than rely on
some dependency inducing neural network on a server somewhere."

TWIDDLE-DEE? Twiddle dumb, I thought.  This was going way over my head,
"Ah...and how is this better than, I don't know, something archaic, say
a textbook?"

Waq's face clouded over, "Well it will have a Cloud, be Digital, Dynamic,
and Deterministic."

"Did you ask ChatGPT to come up with this?"

Waq realised how easily he had fallen fell into the trap created by
an AI that was not above subterfuge in the guise of being helpful. 

"It's ok, Waq.", I consoled him, "This is exactly why you should watch
80s VHS tapes instead of adding to the training dataset of those silicon
cybernetic systems planning to take over the world."

"It's too late, isn't it?"

I would have patted him on his shoulder if I could have reached it. But
an idea struck me. There is another kind of cloud that could be useful.
"Waq, you are a genius!", I said.

## Interactive Word Cloud

Examples of Word Cloud Generators abound on-line. While useful for one off
projects, for flexible and easily configurable it is handy to have a module
for your own language of choice.  MetaCPAN has a couple of options. 
[c0bra(Brian Hann)](https://github.com/c0bra) created
[Image::WordCloud](https://metacpan.org/pod/Image::WordCloud) to generate
raster Word Cloud Images. It is rather clever, depends on SDL to determine
the dimensions of a word to create a attractive word cloud. 
[Sarah Roberts](https://metacpan.org/author/ROBERTSD) created
[HTML::TagCloud](https://metacpan.org/pod/HTML::TagCloud) to generate HTML
Tags. 

<img width="1920" height="1080" alt="image" src="https://github.com/saiftynet/dummyrepo/raw/main/CloudElement/textcloudhtm.png" />

I am developing yet another option, this time using addressable elements
to generate Word Clouds in svg and html.  This potentially allows dynamic
manipulation and interaction with the cloud.  One possible goal is to
develop a deterministic tree connecting multiple such word clouds as part
of an expert system.

My early effort is [CloudElement](https://github.com/saiftynet/CloudElement/)
