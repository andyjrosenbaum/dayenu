\version "2.18.2"  % necessary for upgrading to future LilyPond versions.

\header {
	title = "Dayenu v3"
	composer = "Jewish Traditional"
	arranger = "arr. Andy Rosenbaum & edited Talia Greenberg, Pesach 5780 (2020)"
}


\paper {
  top-system-spacing #'basic-distance = #10
  score-system-spacing #'basic-distance = #20
  system-system-spacing #'basic-distance = #20
  last-bottom-spacing #'basic-distance = #10
}

global = {
  \key d \major
  \time 2/4
  \tempo 4 = 100
}

% =========== %
% verse notes %
% =========== %

sopVerse = \relative d' {
	| fis8^\mf a a a | a b a g 
	| fis  a a a | a b a g 
	| fis  a e g | fis a e g 
	| fis4 e     | d  r |
}

altoVerse = \relative d' {
	| d8 fis fis fis | fis g fis e
	| d  fis fis fis | fis g fis e
	| d  fis cis e   | d fis cis e
	| d4 cis         | a  r |
}

tenorVerse = \relative d' {
	| r8 d r d | r d r cis
	| r a r a  | r a r cis
	| d4 a | a a
	| a4 g | fis  r |
}

bassVerse = \relative d {
	| d8 r d r | a r a r
	| d r d r | a r a r
	| d4 e | fis g
	| a a, | d8 a b cis |
}

% =========== %
% verse words %
% =========== %

mitzWords = \lyricmode {
	| i -- lu ho -- tzi | ho -- tzi -- a -- nu 
	| ho -- tzi -- a -- nu | mi -- mitz -- ra -- yim 
	| ho -- tzi -- a -- nu | mi -- mitz -- ra -- yim 
	| day -- e -- | nu |
}

tenorWords = \lyricmode {
	| ba ba |
	| ba ba
	| ba ba
	| ba ba
	| mi -- mitz -- 
	| ra -- yim 
	| day -- e -- 
	| nu  |
}

bassWords = \lyricmode {
	| dim dim
	| dim dim
	| dim dim
	| dim dim
	| mi -- mitz -- 
	| ra -- yim 
	| day -- e -- 
	| nu doom doom doom |
}

% ============ %
% chorus notes %
% ============ %

sopChorusCommon = \relative d' {
	| fis4^\f fis 
	| a8 g4( e8)
	| g4 g
	| b8 a4( fis8)
	| a4 a
	| d8 cis4 cis8
	| cis a b cis |
}


sopChorusEndOne = \relative d'' {
	| d8 a fis d |
}

sopChorusEndTwo = \relative d'' {
	| d4 r4 |
}

altoChorusCommon = \relative d' {
	| d4 d
	| fis8 e4.
	| e4 e
	| g8 fis4.
	| fis4 fis
	| a8 a4 a8
	| a8 a g g |
}

altoChorusEndOne = \relative d' {
	| fis8 a fis d |
}

altoChorusEndTwo = \relative d' {
	| fis4 r |
}

tenorChorusCommon = \relative d' {
	| a4 a 
	| cis8 cis4.
	| cis4 cis 
	| d8 d4.
	| d4 d 
	| e e 
	| e cis8 cis |
}

tenorChorusEndOne = \relative d' {
	| a2 |
}

tenorChorusEndTwo = \relative d' {
	| a4 r |
}

bassChorusCommon = \relative d {
	| d4 d
	| a8 a4.
	| e'4 a,
	| d8 d4.
	| d4 fis
	| g g 
	| a a, |
}

bassChorusEndOne = \relative d {
	| d2 |
}

bassChorusEndTwo = \relative d {
	| d4 r |
}

% ============ %
% chorus words %
% ============ %

% Specifically allow "day" when in stressed isolation,
%   but keep it "da-" when it's part of the whole word,
%	to avoid closing the diphthong early.

upperChorusWordsCommon = \lyricmode {
	| day- da -- | ye -- nu 
	| day- da -- | ye -- nu
	| day- da -- | ye -- nu da -- 
	| ye -- nu da -- ye -- |
}

upperChorusWordsEndOne = \lyricmode {
	| nu da -- ye -- nu |
}

upperChorusWordsEndTwo = \lyricmode {
	| nu |
}

lowerChorusWordsCommon = \lyricmode {
	| day- da -- | ye -- nu 
	| day- da -- | ye -- nu
	| day- da -- | ye da -- |
}

tenorChorusWordsCommon = {
	\lowerChorusWordsCommon \lyricmode { | ye da -- ye -- | }
}

tenorChorusWordsEndOne = \lyricmode {
	| nu |
}

tenorChorusWordsEndTwo = \lyricmode {
	| nu |
}

bassChorusWordsCommon = {
	\lowerChorusWordsCommon \lyricmode { | ye -- e -- | }
}

bassChorusWordsEndOne = \lyricmode {
	| nu |
}

bassChorusWordsEndTwo = \lyricmode {
	| nu |
}

% ======== %
% in order %
% ======== %

sop = {
	\sopVerse
	\repeat volta 2 \sopChorusCommon
	\alternative {
		{ \sopChorusEndOne }
		{ \sopChorusEndTwo }
	}
}

alto = {
	\altoVerse
	\repeat volta 2 \altoChorusCommon 
	\alternative {
		{ \altoChorusEndOne }
		{ \altoChorusEndTwo }
	}
}

tenor = {
	\tenorVerse
	\repeat volta 2 \tenorChorusCommon
	\alternative {
		{ \tenorChorusEndOne }
		{ \tenorChorusEndTwo }
	}
}

bass = {
	\bassVerse 
	\repeat volta 2 \bassChorusCommon
	\alternative {
		{ \bassChorusEndOne }
		{ \bassChorusEndTwo }
	}
}

sopWordsAll = {
	\mitzWords
	\upperChorusWordsCommon
	\upperChorusWordsEndOne
	\upperChorusWordsEndTwo 
}

altoWordsAll = { 
	\mitzWords
	\upperChorusWordsCommon
	\upperChorusWordsEndOne
	\upperChorusWordsEndTwo 
}

tenorWordsAll = { 
	\tenorWords 
	\tenorChorusWordsCommon 
	\tenorChorusWordsEndOne 
	\tenorChorusWordsEndTwo 
}

bassWordsAll = { 
	\bassWords 
	\bassChorusWordsCommon 
	\bassChorusWordsEndOne 
	\bassChorusWordsEndTwo
}


emptyWords = \lyricmode {}

allStuff = {
  \new ChoirStaff <<
    \new Lyrics = "sopranos" \with {
      % this is needed for lyrics above a staff
      \override VerticalAxisGroup.staff-affinity = #DOWN
    }
    \new Staff = "upper" <<
  \tempo 4 = 100
	\set Staff.midiInstrument = "voice oohs"
      \new Voice = "sopranos" {
        \voiceOne
        << \global \sop >>
      }
      \new Voice = "altos" {
        \voiceTwo
        << \global \alto >>
      }
    >>
    \new Lyrics = "altos"
    \new Lyrics = "tenors" \with {
      % this is needed for lyrics above a staff
      \override VerticalAxisGroup.staff-affinity = #DOWN
    }
    \new Staff = "lower" <<
      \set Staff.midiInstrument = "voice oohs"
      \clef bass
      \new Voice = "tenors" {
        \voiceOne
        << \global \tenor >>
      }
      \new Voice = "basses" {
        \voiceTwo << \global \bass >>
      }
    >>
    \new Lyrics = "basses"
%     \context Lyrics = "sopranos" \lyricsto "sopranos" \emptyWords
    \context Lyrics = "altos" \lyricsto "altos" \altoWordsAll
    \context Lyrics = "tenors" \lyricsto "tenors" \tenorWordsAll
    \context Lyrics = "basses" \lyricsto "basses" \bassWordsAll
  >>
}

% For printed pdf music.
\score {
	\allStuff
	\layout{}
}

% For midi
\score {
	\unfoldRepeats {
		\allStuff
	}
	\midi{ \tempo 4 = 100 }
}
