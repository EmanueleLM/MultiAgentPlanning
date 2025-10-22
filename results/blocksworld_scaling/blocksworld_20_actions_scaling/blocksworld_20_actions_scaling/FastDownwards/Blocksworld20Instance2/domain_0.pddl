; Domain: blocks-world-multiagent
; Agent contributions (distinct):
; Agent 1 (manipulator_1) actions 1–10:
;  1. unstack H from A
;  2. stack H on B
;  3. unstack I from F
;  4. stack I on A
;  5. unstack I from A
;  6. stack I on H
;  7. unstack A from C
;  8. putdown A
;  9. pickup A
; 10. stack A on I
;
; Agent 2 (manipulator_2) actions 11–20:
; 11. unstack C from D
; 12. stack C on A
; 13. unstack G from J
; 14. stack G on F
; 15. unstack C from A
; 16. stack C on J
; 17. pickup D
; 18. putdown D
; 19. unstack A from I
; 20. stack A on G
;
; Note: the domain encodes standard Blocks World actions (pickup, putdown, unstack, stack).
; The above actions are integrated and re-evaluated in sequence (1..20). The PDDL problem
; encodes the public initial arrangement and the goal is the final arrangement after
; applying all legal actions in that ordered sequence.

(define (domain blocks-world-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  ; unstack: take top block ?x off block ?y
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and
      (not (on ?x ?y))
      (not (clear ?x))
      (clear ?y)
      (holding ?x)
      (not (handempty))
    )
  )

  ; stack: put held block ?x onto block ?y
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and
      (not (holding ?x))
      (not (clear ?y))
      (clear ?x)
      (on ?x ?y)
      (handempty)
    )
  )

  ; pickup: pick up a clear block ?x from the table
  (:action pickup
    :parameters (?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty))
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (holding ?x)
      (not (handempty))
    )
  )

  ; putdown: put a held block ?x down on the table
  (:action putdown
    :parameters (?x - block)
    :precondition (and (holding ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (not (holding ?x))
      (handempty)
    )
  )
)