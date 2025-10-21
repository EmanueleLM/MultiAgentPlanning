(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)
  (:objects
    table - place
    a e - block    ; vowel-named blocks (for context)
    b c - block    ; consonant-named blocks (for context)
  )
  (:init
    ;; initial "on" relations
    (on a table)
    (on b table)
    (on c a)
    (on e b)

    ;; initial clear (top) facts: only blocks with nothing on them
    (clear c)
    (clear e)
    ;; note: a and b are not listed as clear because c is on a and e is on b
  )
  (:goal (and
    ;; Global goal: vowels stacked with 'a' supporting 'e'; consonants on the table
    (on a table)
    (on e a)
    (on b table)
    (on c table)
  ))
)