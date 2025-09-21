(define (domain combined_agents)
  (:requirements :strips :typing)
  (:types block)
  (:predicates
    (on ?b - block ?support - block)    ; ?b is on top of ?support
    (ontable ?b - block)                ; ?b is on the table
    (clear ?b - block)                  ; nothing on top of ?b
    (vowel ?b - block)                  ; block is a vowel (A, E, I)
    (consonant ?b - block)              ; block is a consonant
    (handempty)                         ; agent hand is empty (consonant agent)
    (holding ?b - block)                ; consonant agent is holding ?b
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Vowel agent actions (kept distinct, operate only on vowels)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Move a vowel block from one block to another block.
  (:action vowel-move-from-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?b)
    )
  )

  ;; Move a vowel block from the table onto another block.
  (:action vowel-move-from-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  ;; Move a vowel block from a block onto the table.
  (:action vowel-move-from-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
    )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Consonant agent actions (kept distinct; pick/place consonants)
  ;; NOTE: to allow formation of the requested mixed stack, the consonant
  ;; put-down action accepts any clear block as placement target.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Pick up a consonant block from the table (must be top/clear).
  (:action consonant-pick-up-from-table
    :parameters (?b - block)
    :precondition (and (consonant ?b) (ontable ?b) (clear ?b) (handempty))
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty))
              (holding ?b)
            )
  )

  ;; Pick up a consonant block from another block (must be top/clear).
  (:action consonant-pick-up-from
    :parameters (?b - block ?below - block)
    :precondition (and (consonant ?b) (on ?b ?below) (clear ?b) (handempty))
    :effect (and
              (not (on ?b ?below))
              (clear ?below)
              (not (clear ?b))
              (not (handempty))
              (holding ?b)
            )
  )

  ;; Put down a consonant block on the table.
  (:action consonant-put-down-on-table
    :parameters (?b - block)
    :precondition (and (consonant ?b) (holding ?b))
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty)
              (not (holding ?b))
            )
  )

  ;; Put a consonant block onto another clear block.
  ;; (Relaxed compared to the original consonant-only target restriction
  ;; so consonants may be placed on vowels when needed for the combined goal.)
  (:action consonant-put-down-on
    :parameters (?b - block ?t - block)
    :precondition (and (consonant ?b) (holding ?b) (clear ?t))
    :effect (and
              (on ?b ?t)
              (clear ?b)
              (not (clear ?t))
              (handempty)
              (not (holding ?b))
            )
  )
)