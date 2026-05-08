(define (domain linking-with-provenance)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    ; next establishes the required ordering relation between two objects
    (next ?from ?to - obj)
    ; explicit distinctness facts to allow enforcing non-self links without using equality
    (distinct ?a ?b - obj)
  )

  ; Action that creates a next relation when performed by the Player agent (provenance preserved in name)
  (:action set-next-by-player
    :parameters (?from ?to - obj)
    :precondition (and
                    (distinct ?from ?to)
                    (not (next ?from ?to))
                  )
    :effect (and
              (next ?from ?to)
            )
  )

  ; Action that creates a next relation when performed by the Auditor agent (provenance preserved in name)
  (:action set-next-by-auditor
    :parameters (?from ?to - obj)
    :precondition (and
                    (distinct ?from ?to)
                    (not (next ?from ?to))
                  )
    :effect (and
              (next ?from ?to)
            )
  )
)