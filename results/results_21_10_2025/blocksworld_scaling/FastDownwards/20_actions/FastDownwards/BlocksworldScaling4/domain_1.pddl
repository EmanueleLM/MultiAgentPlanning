(define (domain blocksworld-multiagent)
  (:requirements :strips :negative-preconditions :typing)
  (:types obj block place) 

  (:predicates
    (on ?b - block ?p - obj)   ; block on an object (either a block or a place)
    (clear ?o - obj)          ; object (block or place) has nothing on top
    (vowel ?b - block)        ; block is vowel
    (consonant ?b - block)    ; block is consonant
  )

  ;; Consonant agent move: can move any consonant block that is currently clear,
  ;; from its current place to any clear place (block or table spot).
  (:action consonant-move
    :parameters (?b - block ?from - obj ?to - obj)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Vowel agent move: can move any vowel block that is currently clear,
  ;; from its current place to any clear place (block or table spot).
  (:action vowel-move
    :parameters (?b - block ?from - obj ?to - obj)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)