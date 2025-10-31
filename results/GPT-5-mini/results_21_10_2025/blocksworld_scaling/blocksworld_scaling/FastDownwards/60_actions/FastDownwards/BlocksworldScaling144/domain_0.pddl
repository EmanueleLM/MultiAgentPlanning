(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block vowel consonant)
  (:predicates
    (on ?x - block ?y - block)     ; x is directly on y
    (ontable ?x - block)          ; x is directly on the table (bottom of a stack)
    (clear ?x - block)            ; nothing on top of x (x is a top block)
  )

  ;; Vowel-agent actions (may move only vowels A,E,I)
  (:action vowel-move-from-on-to-block
    :parameters (?x - vowel ?s - block ?y - block)
    :precondition (and (on ?x ?s) (clear ?x) (clear ?y))
    :effect (and
      (not (on ?x ?s))
      (on ?x ?y)
      (not (clear ?y))
      (clear ?s)
    )
  )

  (:action vowel-move-from-table-to-block
    :parameters (?x - vowel ?y - block)
    :precondition (and (ontable ?x) (clear ?y))
    :effect (and
      (not (ontable ?x))
      (on ?x ?y)
      (not (clear ?y))
    )
  )

  (:action vowel-move-from-on-to-table
    :parameters (?x - vowel ?s - block)
    :precondition (and (on ?x ?s) (clear ?x))
    :effect (and
      (not (on ?x ?s))
      (ontable ?x)
      (clear ?s)
    )
  )

  ;; Consonant-agent actions (may move only consonants B,C,D,F,G,H,J,K,L)
  (:action consonant-move-from-on-to-block
    :parameters (?x - consonant ?s - block ?y - block)
    :precondition (and (on ?x ?s) (clear ?x) (clear ?y))
    :effect (and
      (not (on ?x ?s))
      (on ?x ?y)
      (not (clear ?y))
      (clear ?s)
    )
  )

  (:action consonant-move-from-table-to-block
    :parameters (?x - consonant ?y - block)
    :precondition (and (ontable ?x) (clear ?y))
    :effect (and
      (not (ontable ?x))
      (on ?x ?y)
      (not (clear ?y))
    )
  )

  (:action consonant-move-from-on-to-table
    :parameters (?x - consonant ?s - block)
    :precondition (and (on ?x ?s) (clear ?x))
    :effect (and
      (not (on ?x ?s))
      (ontable ?x)
      (clear ?s)
    )
  )
)