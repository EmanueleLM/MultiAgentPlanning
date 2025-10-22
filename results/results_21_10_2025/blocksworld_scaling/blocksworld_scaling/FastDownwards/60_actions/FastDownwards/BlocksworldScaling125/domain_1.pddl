(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block tablepos - object)

  (:predicates
    (on ?b - block ?x - object)      ; block ?b is directly on object ?x (block or tablepos)
    (clear ?x - object)             ; no block is on top of object ?x (object is a clear stack top / empty tablepos)
    (is-vowel ?b - block)           ; block is a vowel (movable by vowel agent)
    (is-consonant ?b - block)       ; block is a consonant (movable by consonant agent)
  )

  ;; Vowel-agent action: moves a vowel block from any object (block/tablepos) to any clear object (block/tablepos).
  (:action move-vowel
    :parameters (?b - block ?from - object ?to - object)
    :precondition (and
      (is-vowel ?b)
      (on ?b ?from)
      (clear ?b)         ; only top blocks can be moved
      (clear ?to)        ; can only place on top of a top block or an empty table position
      (not (= ?b ?to))   ; cannot move onto itself
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)      ; after removal the from-object becomes clear (tablepos or block)
      (not (clear ?to))  ; destination is no longer clear because ?b is placed on it
    )
  )

  ;; Consonant-agent action: moves a consonant block from any object (block/tablepos) to any clear object (block/tablepos).
  (:action move-consonant
    :parameters (?b - block ?from - object ?to - object)
    :precondition (and
      (is-consonant ?b)
      (on ?b ?from)
      (clear ?b)         ; only top blocks can be moved
      (clear ?to)        ; can only place on top of a top block or an empty table position
      (not (= ?b ?to))   ; cannot move onto itself
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)      ; after removal the from-object becomes clear (tablepos or block)
      (not (clear ?to))  ; destination is no longer clear because ?b is placed on it
    )
  )
)