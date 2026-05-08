(define (domain blocks-operator-sequenced)
  (:requirements :strips :typing :negative-preconditions)
  (:types block loc step)

  (:predicates
    (on ?b - block ?l - loc)
    (clear ?b - block)
    (handempty)
    (holding ?b - block)
    (allowed ?s - step)
  )

  (:action op-unstack-orange-red
    :precondition (and (handempty) (on orange red) (clear orange) (allowed step1))
    :effect (and
      (holding orange)
      (not (on orange red))
      (not (clear orange))
      (clear red)
      (not (handempty))
      (not (allowed step1))
      (allowed step2)
    )
  )

  (:action op-putdown-orange-table
    :precondition (and (holding orange) (allowed step2))
    :effect (and
      (on orange table)
      (clear orange)
      (handempty)
      (not (holding orange))
      (not (allowed step2))
      (allowed step3)
    )
  )

  (:action op-unstack-red-yellow
    :precondition (and (handempty) (on red yellow) (clear red) (allowed step3))
    :effect (and
      (holding red)
      (not (on red yellow))
      (not (clear red))
      (clear yellow)
      (not (handempty))
      (not (allowed step3))
      (allowed step4)
    )
  )

  (:action op-putdown-red-table
    :precondition (and (holding red) (allowed step4))
    :effect (and
      (on red table)
      (clear red)
      (handempty)
      (not (holding red))
      (not (allowed step4))
      (allowed step5)
    )
  )

  (:action op-pickup-yellow-table
    :precondition (and (handempty) (on yellow table) (clear yellow) (allowed step5))
    :effect (and
      (holding yellow)
      (not (on yellow table))
      (not (clear yellow))
      (not (handempty))
      (not (allowed step5))
      (allowed step6)
    )
  )

  (:action op-stack-yellow-orange
    :precondition (and (holding yellow) (clear orange) (allowed step6))
    :effect (and
      (on yellow orange)
      (clear yellow)
      (not (clear orange))
      (handempty)
      (not (holding yellow))
      (not (allowed step6))
      (allowed step7)
    )
  )

  (:action op-pickup-red-table
    :precondition (and (handempty) (on red table) (clear red) (allowed step7))
    :effect (and
      (holding red)
      (not (on red table))
      (not (clear red))
      (not (handempty))
      (not (allowed step7))
      (allowed step8)
    )
  )

  (:action op-stack-red-yellow
    :precondition (and (holding red) (clear yellow) (on yellow orange) (allowed step8))
    :effect (and
      (on red yellow)
      (clear red)
      (not (clear yellow))
      (handempty)
      (not (holding red))
      (not (allowed step8))
      (allowed step9)
    )
  )

  (:action op-pickup-blue-table
    :precondition (and (handempty) (on blue table) (clear blue) (allowed step9))
    :effect (and
      (holding blue)
      (not (on blue table))
      (not (clear blue))
      (not (handempty))
      (not (allowed step9))
      (allowed step10)
    )
  )

  (:action op-stack-blue-red
    :precondition (and (holding blue) (clear red) (on red yellow) (allowed step10))
    :effect (and
      (on blue red)
      (clear blue)
      (not (clear red))
      (handempty)
      (not (holding blue))
      (not (allowed step10))
    )
  )
)