(define (domain hanoi-two-agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    (on ?d - disk ?s - object)            ; disk ?d is directly supported by object ?s (disk or peg)
    (stack-top ?p - peg ?d - disk)       ; disk ?d is currently the top disk on peg ?p
    (empty ?p - peg)                     ; peg ?p has no disks
    (smaller ?d1 - disk ?d2 - disk)      ; ?d1 is strictly smaller than ?d2
  )

  ; Agent 1: the ordered, primitive, ground moves provided must occur in sequence.
  ; Each action encodes the exact preconditions expected at that step and the precise
  ; effects on the direct-support (on), stack-top and empty predicates.
  (:action agent1-step1-move-a-left-to-right
    :precondition (and
                    (on a b)
                    (stack-top left a)
                    (empty right)
                   )
    :effect (and
             (not (on a b))
             (on a right)
             (not (stack-top left a))
             (stack-top left b)
             (not (empty right))
             (stack-top right a)
            )
  )

  (:action agent1-step2-move-b-left-to-middle
    :precondition (and
                    (on b c)
                    (stack-top left b)
                    (empty middle)
                   )
    :effect (and
             (not (on b c))
             (on b middle)
             (not (stack-top left b))
             (stack-top left c)
             (not (empty middle))
             (stack-top middle b)
            )
  )

  (:action agent1-step3-move-a-right-to-middle
    :precondition (and
                    (on a right)
                    (stack-top right a)
                    (stack-top middle b)
                    (smaller a b)
                   )
    :effect (and
             (not (on a right))
             (on a b)
             (not (stack-top right a))
             (stack-top right b)     ; after removing a, b becomes top of right (but b will then be covered by a on middle)
             (not (stack-top middle b))
             (stack-top middle a)
            )
  )

  (:action agent1-step4-move-c-left-to-right
    :precondition (and
                    (on c d)
                    (stack-top left c)
                    (empty right)
                   )
    :effect (and
             (not (on c d))
             (on c right)
             (not (stack-top left c))
             (stack-top left d)
             (not (empty right))
             (stack-top right c)
            )
  )

  (:action agent1-step5-move-a-middle-to-left
    :precondition (and
                    (on a b)
                    (stack-top middle a)
                    (stack-top left d)
                    (smaller a d)
                   )
    :effect (and
             (not (on a b))
             (on a d)
             (not (stack-top middle a))
             (stack-top middle b)
             (not (stack-top left d))
             (stack-top left a)
            )
  )

  (:action agent1-step6-move-b-middle-to-right
    :precondition (and
                    (on b middle)
                    (stack-top middle b)
                    (stack-top right c)
                    (smaller b c)
                   )
    :effect (and
             (not (on b middle))
             (on b c)
             (not (stack-top middle b))
             (empty middle)
             (not (stack-top right c))
             (stack-top right b)
            )
  )

  (:action agent1-step7-move-a-left-to-right
    :precondition (and
                    (on a d)
                    (stack-top left a)
                    (stack-top right b)
                    (smaller a b)
                   )
    :effect (and
             (not (on a d))
             (on a b)
             (not (stack-top left a))
             (stack-top left d)
             (not (stack-top right b))
             (stack-top right a)
            )
  )

  (:action agent1-step8-move-d-left-to-middle
    :precondition (and
                    (on d e)
                    (stack-top left d)
                    (empty middle)
                   )
    :effect (and
             (not (on d e))
             (on d middle)
             (not (stack-top left d))
             (stack-top left e)
             (not (empty middle))
             (stack-top middle d)
            )
  )

  (:action agent1-step9-move-a-right-to-middle
    :precondition (and
                    (on a b)
                    (stack-top right a)
                    (stack-top middle d)
                    (smaller a d)
                   )
    :effect (and
             (not (on a b))
             (on a d)
             (not (stack-top right a))
             (stack-top right b)
             (not (stack-top middle d))
             (stack-top middle a)
            )
  )

  (:action agent1-step10-move-b-right-to-left
    :precondition (and
                    (on b c)
                    (stack-top right b)
                    (stack-top left e)
                    (smaller b e)
                   )
    :effect (and
             (not (on b c))
             (on b e)
             (not (stack-top right b))
             (stack-top right c)
             (not (stack-top left e))
             (stack-top left b)
            )
  )

  (:action agent1-step11-move-a-middle-to-right
    :precondition (and
                    (on a d)
                    (stack-top middle a)
                    (stack-top right c)
                    (smaller a c)
                   )
    :effect (and
             (not (on a d))
             (on a c)
             (not (stack-top middle a))
             (stack-top middle d)
             (not (stack-top right c))
             (stack-top right a)
            )
  )

)