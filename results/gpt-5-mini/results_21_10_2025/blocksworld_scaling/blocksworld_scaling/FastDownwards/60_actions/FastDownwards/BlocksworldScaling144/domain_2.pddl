(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types vowel consonant - block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
  )

  ;; Vowel-agent actions (may move only vowels A,E,I)
  (:action vowel-move-from-on-to-block
    :parameters (?x - vowel ?s - block ?y - block)
    :precondition (and
      (on ?x ?s)
      (clear ?x)
      (clear ?y)
    )
    :effect (and
      (not (on ?x ?s))
      (on ?x ?y)
      (not (clear ?y))
      (clear ?s)
      (clear ?x)
    )
  )

  (:action vowel-move-from-table-to-block
    :parameters (?x - vowel ?y - block)
    :precondition (and
      (ontable ?x)
      (clear ?y)
    )
    :effect (and
      (not (ontable ?x))
      (on ?x ?y)
      (not (clear ?y))
      (clear ?x)
    )
  )

  (:action vowel-move-from-on-to-table
    :parameters (?x - vowel ?s - block)
    :precondition (and
      (on ?x ?s)
      (clear ?x)
    )
    :effect (and
      (not (on ?x ?s))
      (ontable ?x)
      (clear ?s)
      (clear ?x)
    )
  )

  ;; Consonant-agent actions (may move only consonants B,C,D,F,G,H,J,K,L)
  (:action consonant-move-from-on-to-block
    :parameters (?x - consonant ?s - block ?y - block)
    :precondition (and
      (on ?x ?s)
      (clear ?x)
      (clear ?y)
    )
    :effect (and
      (not (on ?x ?s))
      (on ?x ?y)
      (not (clear ?y))
      (clear ?s)
      (clear ?x)
    )
  )

  (:action consonant-move-from-table-to-block
    :parameters (?x - consonant ?y - block)
    :precondition (and
      (ontable ?x)
      (clear ?y)
    )
    :effect (and
      (not (ontable ?x))
      (on ?x ?y)
      (not (clear ?y))
      (clear ?x)
    )
  )

  (:action consonant-move-from-on-to-table
    :parameters (?x - consonant ?s - block)
    :precondition (and
      (on ?x ?s)
      (clear ?x)
    )
    :effect (and
      (not (on ?x ?s))
      (ontable ?x)
      (clear ?s)
      (clear ?x)
    )
  )
)