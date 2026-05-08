(define (domain blocksworld-sequenced)
  (:requirements :strips :typing :negative-preconditions)
  (:types entity block table stage)

  (:predicates
    (on ?b - block ?p - entity)
    (clear ?b - block)
    (handempty)
    (holding ?b - block)
    (allowed ?s - stage)
    (next ?s - stage ?t - stage)
  )

  (:action op-unstack-orange-red
    :parameters (?s - stage ?s2 - stage)
    :precondition (and
      (allowed ?s)
      (next ?s ?s2)
      (handempty)
      (on orange red)
      (clear orange)
    )
    :effect (and
      (holding orange)
      (not (on orange red))
      (not (clear orange))
      (clear red)
      (not (handempty))
      (not (allowed ?s))
      (allowed ?s2)
    )
  )

  (:action op-putdown-orange-table
    :parameters (?s - stage ?s2 - stage)
    :precondition (and
      (allowed ?s)
      (next ?s ?s2)
      (holding orange)
    )
    :effect (and
      (on orange table)
      (clear orange)
      (handempty)
      (not (holding orange))
      (not (allowed ?s))
      (allowed ?s2)
    )
  )

  (:action op-unstack-red-yellow
    :parameters (?s - stage ?s2 - stage)
    :precondition (and
      (allowed ?s)
      (next ?s ?s2)
      (handempty)
      (on red yellow)
      (clear red)
    )
    :effect (and
      (holding red)
      (not (on red yellow))
      (not (clear red))
      (clear yellow)
      (not (handempty))
      (not (allowed ?s))
      (allowed ?s2)
    )
  )

  (:action op-putdown-red-table
    :parameters (?s - stage ?s2 - stage)
    :precondition (and
      (allowed ?s)
      (next ?s ?s2)
      (holding red)
    )
    :effect (and
      (on red table)
      (clear red)
      (handempty)
      (not (holding red))
      (not (allowed ?s))
      (allowed ?s2)
    )
  )

  (:action op-pickup-yellow-table
    :parameters (?s - stage ?s2 - stage)
    :precondition (and
      (allowed ?s)
      (next ?s ?s2)
      (handempty)
      (on yellow table)
      (clear yellow)
    )
    :effect (and
      (holding yellow)
      (not (on yellow table))
      (not (clear yellow))
      (not (handempty))
      (not (allowed ?s))
      (allowed ?s2)
    )
  )

  (:action op-stack-yellow-orange
    :parameters (?s - stage ?s2 - stage)
    :precondition (and
      (allowed ?s)
      (next ?s ?s2)
      (holding yellow)
      (clear orange)
    )
    :effect (and
      (on yellow orange)
      (clear yellow)
      (not (clear orange))
      (handempty)
      (not (holding yellow))
      (not (allowed ?s))
      (allowed ?s2)
    )
  )

  (:action op-pickup-red-table
    :parameters (?s - stage ?s2 - stage)
    :precondition (and
      (allowed ?s)
      (next ?s ?s2)
      (handempty)
      (on red table)
      (clear red)
    )
    :effect (and
      (holding red)
      (not (on red table))
      (not (clear red))
      (not (handempty))
      (not (allowed ?s))
      (allowed ?s2)
    )
  )

  (:action op-stack-red-yellow
    :parameters (?s - stage ?s2 - stage)
    :precondition (and
      (allowed ?s)
      (next ?s ?s2)
      (holding red)
      (clear yellow)
      (on yellow orange)
    )
    :effect (and
      (on red yellow)
      (clear red)
      (not (clear yellow))
      (handempty)
      (not (holding red))
      (not (allowed ?s))
      (allowed ?s2)
    )
  )

  (:action op-pickup-blue-table
    :parameters (?s - stage ?s2 - stage)
    :precondition (and
      (allowed ?s)
      (next ?s ?s2)
      (handempty)
      (on blue table)
      (clear blue)
    )
    :effect (and
      (holding blue)
      (not (on blue table))
      (not (clear blue))
      (not (handempty))
      (not (allowed ?s))
      (allowed ?s2)
    )
  )

  (:action op-stack-blue-red
    :parameters (?s - stage ?s2 - stage)
    :precondition (and
      (allowed ?s)
      (next ?s ?s2)
      (holding blue)
      (clear red)
      (on red yellow)
    )
    :effect (and
      (on blue red)
      (clear blue)
      (not (clear red))
      (handempty)
      (not (holding blue))
      (not (allowed ?s))
      (allowed ?s2)
    )
  )
)