(define (domain multiagent_blocks_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types block vowel consonant)

  (:predicates
    (on ?x - block ?y - block)      ; ?x is directly on ?y
    (ontable ?x - block)           ; ?x is on the table (a stack base position)
    (clear ?x - block)             ; nothing on top of ?x
  )

  ;; ===== Vowel agent actions (can move only vowels: A, E, I) =====
  ;; Move a vowel from on top of block ?s onto another block ?d
  (:action vowel-move-block-to-block
    :parameters (?x - vowel ?s - block ?d - block)
    :precondition (and (on ?x ?s) (clear ?x) (clear ?d))
    :effect (and
      (not (on ?x ?s))
      (on ?x ?d)
      (not (clear ?d))
      (clear ?s)
      (clear ?x)
    )
  )

  ;; Move a vowel from table onto a block ?d
  (:action vowel-move-table-to-block
    :parameters (?x - vowel ?d - block)
    :precondition (and (ontable ?x) (clear ?x) (clear ?d))
    :effect (and
      (not (ontable ?x))
      (on ?x ?d)
      (not (clear ?d))
      (clear ?x)
    )
  )

  ;; Move a vowel from on top of block ?s onto the table
  (:action vowel-move-block-to-table
    :parameters (?x - vowel ?s - block)
    :precondition (and (on ?x ?s) (clear ?x))
    :effect (and
      (not (on ?x ?s))
      (ontable ?x)
      (clear ?s)
      (clear ?x)
    )
  )

  ;; ===== Consonant agent actions (can move only consonants: B,C,D,F,G,H,J,K,L) =====
  ;; Move a consonant from on top of block ?s onto another block ?d
  (:action consonant-move-block-to-block
    :parameters (?x - consonant ?s - block ?d - block)
    :precondition (and (on ?x ?s) (clear ?x) (clear ?d))
    :effect (and
      (not (on ?x ?s))
      (on ?x ?d)
      (not (clear ?d))
      (clear ?s)
      (clear ?x)
    )
  )

  ;; Move a consonant from table onto a block ?d
  (:action consonant-move-table-to-block
    :parameters (?x - consonant ?d - block)
    :precondition (and (ontable ?x) (clear ?x) (clear ?d))
    :effect (and
      (not (ontable ?x))
      (on ?x ?d)
      (not (clear ?d))
      (clear ?x)
    )
  )

  ;; Move a consonant from on top of block ?s onto the table
  (:action consonant-move-block-to-table
    :parameters (?x - consonant ?s - block)
    :precondition (and (on ?x ?s) (clear ?x))
    :effect (and
      (not (on ?x ?s))
      (ontable ?x)
      (clear ?s)
      (clear ?x)
    )
  )
)