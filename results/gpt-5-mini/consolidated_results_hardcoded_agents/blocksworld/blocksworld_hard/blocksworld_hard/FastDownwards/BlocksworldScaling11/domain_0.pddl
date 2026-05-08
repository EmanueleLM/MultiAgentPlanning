(define (domain blocks-operator-sequenced)
  (:requirements :strips :typing :negative-preconditions)
  (:types block loc step)

  (:predicates
    (on ?b - block ?l - loc)           ; block b is directly on location l (block or table)
    (clear ?b - block)                 ; block has nothing on it and is not being held
    (handempty)                        ; the single hand is empty
    (holding ?b - block)               ; the single hand holds block b
    (allowed ?s - step)                ; explicit step-permission to enforce sequence
  )

  ;; Step 1: operator unstack orange from red
  (:action op-unstack-orange-red
    :precondition (and
      (handempty)
      (on orange red)
      (clear orange)
      (allowed step1)
    )
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

  ;; Step 2: operator put-down orange on table
  (:action op-putdown-orange-table
    :precondition (and
      (holding orange)
      (allowed step2)
    )
    :effect (and
      (on orange table)
      (clear orange)
      (handempty)
      (not (holding orange))
      (not (allowed step2))
      (allowed step3)
    )
  )

  ;; Step 3: operator unstack red from yellow
  (:action op-unstack-red-yellow
    :precondition (and
      (handempty)
      (on red yellow)
      (clear red)
      (allowed step3)
    )
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

  ;; Step 4: operator put-down red on table
  (:action op-putdown-red-table
    :precondition (and
      (holding red)
      (allowed step4)
    )
    :effect (and
      (on red table)
      (clear red)
      (handempty)
      (not (holding red))
      (not (allowed step4))
      (allowed step5)
    )
  )

  ;; Step 5: operator pick-up yellow from table
  (:action op-pickup-yellow-table
    :precondition (and
      (handempty)
      (on yellow table)
      (clear yellow)
      (allowed step5)
    )
    :effect (and
      (holding yellow)
      (not (on yellow table))
      (not (clear yellow))
      (not (handempty))
      (not (allowed step5))
      (allowed step6)
    )
  )

  ;; Step 6: operator stack yellow onto orange
  (:action op-stack-yellow-orange
    :precondition (and
      (holding yellow)
      (clear orange)
      (allowed step6)
    )
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

  ;; Step 7: operator pick-up red from table
  (:action op-pickup-red-table
    :precondition (and
      (handempty)
      (on red table)
      (clear red)
      (allowed step7)
    )
    :effect (and
      (holding red)
      (not (on red table))
      (not (clear red))
      (not (handempty))
      (not (allowed step7))
      (allowed step8)
    )
  )

  ;; Step 8: operator stack red onto yellow
  (:action op-stack-red-yellow
    :precondition (and
      (holding red)
      (clear yellow)
      (on yellow orange)   ; explicit support-location check as specified in the operator plan
      (allowed step8)
    )
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

  ;; Step 9: operator pick-up blue from table
  (:action op-pickup-blue-table
    :precondition (and
      (handempty)
      (on blue table)
      (clear blue)
      (allowed step9)
    )
    :effect (and
      (holding blue)
      (not (on blue table))
      (not (clear blue))
      (not (handempty))
      (not (allowed step9))
      (allowed step10)
    )
  )

  ;; Step 10: operator stack blue onto red
  (:action op-stack-blue-red
    :precondition (and
      (holding blue)
      (clear red)
      (on red yellow)      ; explicit support-location check as specified in the operator plan
      (allowed step10)
    )
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