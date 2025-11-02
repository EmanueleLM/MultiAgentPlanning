(define (domain blocks_world_agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types vowel consonant - block block)
  ; Note: vowel and consonant are subtypes of block.
  (:predicates
    (on ?b - block ?under - block)    ; ?b is directly on top of ?under
    (ontable ?b - block)              ; ?b is on the table (stack bottom)
    (clear ?b - block)                ; nothing on top of ?b (it is a top block)
  )

  ; ===== Vowel-agent actions =====
  ; Move a vowel block from table onto another block
  (:action move-vowel-from-table-to-block
    :parameters (?b - vowel ?dest - block)
    :precondition (and
                    (ontable ?b)
                    (clear ?b)
                    (clear ?dest)
                    (not (= ?b ?dest))
                    (not (= ?b I))    ; Respect vowel-agent preference: do not move I
                  )
    :effect (and
             (not (ontable ?b))
             (on ?b ?dest)
             (not (clear ?dest))
            )
  )

  ; Move a vowel block from one block onto another block
  (:action move-vowel-from-block-to-block
    :parameters (?b - vowel ?from - block ?dest - block)
    :precondition (and
                    (on ?b ?from)
                    (clear ?b)
                    (clear ?dest)
                    (not (= ?b ?dest))
                    (not (= ?b ?from))
                    (not (= ?b I))    ; Respect vowel-agent preference: do not move I
                  )
    :effect (and
             (not (on ?b ?from))
             (on ?b ?dest)
             (clear ?from)
             (not (clear ?dest))
            )
  )

  ; Move a vowel block from on top of one block to the table
  (:action move-vowel-from-block-to-table
    :parameters (?b - vowel ?from - block)
    :precondition (and
                    (on ?b ?from)
                    (clear ?b)
                    (not (= ?b I))    ; Respect vowel-agent preference: do not move I
                  )
    :effect (and
             (not (on ?b ?from))
             (ontable ?b)
             (clear ?from)
            )
  )

  ; ===== Consonant-agent actions =====
  ; Move a consonant block from table onto another block
  (:action move-consonant-from-table-to-block
    :parameters (?b - consonant ?dest - block)
    :precondition (and
                    (ontable ?b)
                    (clear ?b)
                    (clear ?dest)
                    (not (= ?b ?dest))
                  )
    :effect (and
             (not (ontable ?b))
             (on ?b ?dest)
             (not (clear ?dest))
            )
  )

  ; Move a consonant block from one block onto another block
  (:action move-consonant-from-block-to-block
    :parameters (?b - consonant ?from - block ?dest - block)
    :precondition (and
                    (on ?b ?from)
                    (clear ?b)
                    (clear ?dest)
                    (not (= ?b ?dest))
                    (not (= ?b ?from))
                  )
    :effect (and
             (not (on ?b ?from))
             (on ?b ?dest)
             (clear ?from)
             (not (clear ?dest))
            )
  )

  ; Move a consonant block from on top of one block to the table
  (:action move-consonant-from-block-to-table
    :parameters (?b - consonant ?from - block)
    :precondition (and
                    (on ?b ?from)
                    (clear ?b)
                  )
    :effect (and
             (not (on ?b ?from))
             (ontable ?b)
             (clear ?from)
            )
  )
)