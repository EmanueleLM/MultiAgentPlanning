(define (domain multiagent-stacking)
  (:requirements :strips :typing)
  (:types block vowel consonant)
  (:predicates
    (on ?b - block ?under - block)    ; ?b is directly on ?under
    (ontable ?b - block)              ; ?b sits on the table (base of a stack)
    (clear ?b - block)                ; no block on top of ?b (i.e., ?b is top)
  )

  ;; Vowel agent actions (may move only vowel-typed blocks)

  ;; Move a vowel that sits on another block onto the table (create a new stack)
  (:action vowel-move-from-block-to-table
    :parameters (?v - vowel ?under - block)
    :precondition (and (clear ?v) (on ?v ?under))
    :effect (and
      (ontable ?v)
      (clear ?v)
      (clear ?under)
      (not (on ?v ?under))
    )
  )

  ;; Move a vowel from the table onto a top block ?x
  (:action vowel-move-from-table-onto-block
    :parameters (?v - vowel ?x - block)
    :precondition (and (clear ?v) (ontable ?v) (clear ?x))
    :effect (and
      (on ?v ?x)
      (clear ?v)
      (not (ontable ?v))
      (not (clear ?x))
    )
  )

  ;; Move a vowel from on-top-of-?under onto top block ?x (both on-block moves)
  (:action vowel-move-from-block-onto-block
    :parameters (?v - vowel ?under - block ?x - block)
    :precondition (and (clear ?v) (on ?v ?under) (clear ?x))
    :effect (and
      (on ?v ?x)
      (clear ?v)
      (clear ?under)
      (not (on ?v ?under))
      (not (clear ?x))
    )
  )

  ;; Consonant agent actions (may move only consonant-typed blocks)

  ;; Move a consonant that sits on another block onto the table (create a new stack)
  (:action consonant-move-from-block-to-table
    :parameters (?c - consonant ?under - block)
    :precondition (and (clear ?c) (on ?c ?under))
    :effect (and
      (ontable ?c)
      (clear ?c)
      (clear ?under)
      (not (on ?c ?under))
    )
  )

  ;; Move a consonant from the table onto a top block ?x
  (:action consonant-move-from-table-onto-block
    :parameters (?c - consonant ?x - block)
    :precondition (and (clear ?c) (ontable ?c) (clear ?x))
    :effect (and
      (on ?c ?x)
      (clear ?c)
      (not (ontable ?c))
      (not (clear ?x))
    )
  )

  ;; Move a consonant from on-top-of-?under onto top block ?x (both on-block moves)
  (:action consonant-move-from-block-onto-block
    :parameters (?c - consonant ?under - block ?x - block)
    :precondition (and (clear ?c) (on ?c ?under) (clear ?x))
    :effect (and
      (on ?c ?x)
      (clear ?c)
      (clear ?under)
      (not (on ?c ?under))
      (not (clear ?x))
    )
  )

)