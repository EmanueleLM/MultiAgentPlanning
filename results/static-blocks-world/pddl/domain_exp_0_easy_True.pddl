(define (domain multi-behavior-blockworld)
  (:requirements :strips :typing)

  (:types block)

  (:predicates
    (on-table ?b - block)          ; block is on the table
    (on ?b1 ?b2 - block)           ; ?b1 is directly on ?b2
    (clear ?b - block)             ; no block on top of ?b
    (hand-empty-A)                 ; agent A’s hand is empty
    (hand-empty-B)                 ; agent B’s hand is empty
    (holding-A ?b - block)         ; agent A holds ?b
    (holding-B ?b - block)         ; agent B holds ?b
    (vowel ?b - block)             ; ?b is a vowel
    (consonant ?b - block)         ; ?b is a consonant
  )

  ; ------------------------------------------------------------------
  ; Actions – only agents may move blocks of the appropriate type
  ; ------------------------------------------------------------------

  ; Agent A can pick up a vowel block that is on the table
  (:action pick-up-vowel
    :parameters (?b - block)
    :precondition (and
                    (hand-empty-A)
                    (on-table ?b)
                    (clear ?b)
                    (vowel ?b))
    :effect (and
              (not (hand-empty-A))
              (not (on-table ?b))
              (not (clear ?b))
              (holding-A ?b))) 

  ; Agent A can stack a vowel block onto a clear block
  (:action stack-vowel
    :parameters (?b1 ?b2 - block)
    :precondition (and
                    (holding-A ?b1)
                    (clear ?b2)
                    (vowel ?b1))
    :effect (and
              (not (holding-A ?b1))
              (hand-empty-A)
              (not (clear ?b2))
              (on ?b1 ?b2)
              (clear ?b1))) 

  ; (Optional) put‑down actions – not needed for this particular plan
  (:action put-down-vowel
    :parameters (?b - block)
    :precondition (and
                    (holding-A ?b)
                    (vowel ?b))
    :effect (and
              (hand-empty-A)
              (not (holding-A ?b))
              (on-table ?b)
              (clear ?b))) 

  ; ------------------------------------------------------------
  ; Agent B – consonant blocks only
  ; ------------------------------------------------------------

  (:action pick-up-consonant
    :parameters (?b - block)
    :precondition (and
                    (hand-empty-B)
                    (on-table ?b)
                    (clear ?b)
                    (consonant ?b))
    :effect (and
              (not (hand-empty-B))
              (not (on-table ?b))
              (not (clear ?b))
              (holding-B ?b))) 

  (:action stack-consonant
    :parameters (?b1 ?b2 - block)
    :precondition (and
                    (holding-B ?b1)
                    (clear ?b2)
                    (consonant ?b1))
    :effect (and
              (not (holding-B ?b1))
              (hand-empty-B)
              (not (clear ?b2))
              (on ?b1 ?b2)
              (clear ?b1))) 

  (:action put-down-consonant
    :parameters (?b - block)
    :precondition (and
                    (holding-B ?b)
                    (consonant ?b))
    :effect (and
              (hand-empty-B)
              (not (holding-B ?b))
              (on-table ?b)
              (clear ?b))) 
)