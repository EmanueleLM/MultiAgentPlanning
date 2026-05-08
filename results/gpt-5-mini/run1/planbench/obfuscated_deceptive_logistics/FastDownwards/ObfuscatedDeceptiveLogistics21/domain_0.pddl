(define (domain object-sequencing)
  (:requirements :strips :typing :negative-preconditions)
  (:types item)

  (:predicates
    (next ?a - item ?b - item)            ; a is immediately before b
    (has-successor ?a - item)             ; a already has a successor
    (has-predecessor ?a - item)           ; a already has a predecessor
  )

  ; Action provided by the player agent (provenance: player)
  (:action place-next_player
    :parameters (?a - item ?b - item)
    :precondition (and
                    (not (has-successor ?a))
                    (not (has-predecessor ?b))
                    (not (= ?a ?b))
                  )
    :effect (and
              (next ?a ?b)
              (has-successor ?a)
              (has-predecessor ?b)
            )
  )

  ; Action provided by the auditor agent (provenance: auditor)
  (:action place-next_auditor
    :parameters (?a - item ?b - item)
    :precondition (and
                    (not (has-successor ?a))
                    (not (has-predecessor ?b))
                    (not (= ?a ?b))
                  )
    :effect (and
              (next ?a ?b)
              (has-successor ?a)
              (has-predecessor ?b)
            )
  )

)