(define (domain hanoi-coop-uniqueplan)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent step)

  (:predicates
    (on-disk ?d - disk ?p - disk)    ;; disk ?d is on top of disk ?p
    (on-peg  ?d - disk ?p - peg)     ;; disk ?d is the bottom-most disk on peg ?p
    (clear-disk ?d - disk)           ;; disk ?d has nothing on top
    (clear-peg  ?p - peg)            ;; peg ?p has no disks
    (smaller ?d1 - disk ?d2 - disk)  ;; ?d1 is smaller than ?d2
    (can-move ?ag - agent ?d - disk) ;; permission: agent may move disk
    (at ?s - step)                   ;; control-stage predicate for sequencing
  )

  ;; All actions correspond exactly to the moves in the proposed solution.
  ;; Each action requires the current stage (at sN) and advances to (at sN+1).
  ;; Each action also requires the can-move fact for the agent moving that disk,
  ;; enforcing agent-specific permissions.

  ;; 1: agent_1: A left -> middle (peg empty)
  (:action move-agent1-a-left-middle
    :precondition (and (at s0)
                       (on-disk a b)
                       (clear-disk a)
                       (clear-peg middle)
                       (can-move agent_1 a))
    :effect (and
             (not (on-disk a b))
             (on-peg a middle)
             (not (clear-peg middle))
             (clear-disk b)
             (not (at s0)) (at s1))
  )

  ;; 2: agent_1: B left -> right (peg empty)
  (:action move-agent1-b-left-right
    :precondition (and (at s1)
                       (on-disk b c)
                       (clear-disk b)
                       (clear-peg right)
                       (can-move agent_1 b))
    :effect (and
             (not (on-disk b c))
             (on-peg b right)
             (not (clear-peg right))
             (clear-disk c)
             (not (at s1)) (at s2))
  )

  ;; 3: agent_1: A middle -> right (onto disk B)
  (:action move-agent1-a-middle-right-onto-b
    :precondition (and (at s2)
                       (on-peg a middle)
                       (clear-disk a)
                       (on-peg b right)
                       (clear-disk b)
                       (can-move agent_1 a))
    :effect (and
             (not (on-peg a middle))
             (on-disk a b)
             (clear-peg middle)
             (not (clear-disk b))
             (not (at s2)) (at s3))
  )

  ;; 4: agent_1: C left -> middle (peg empty)
  (:action move-agent1-c-left-middle
    :precondition (and (at s3)
                       (on-disk c d)
                       (clear-disk c)
                       (clear-peg middle)
                       (can-move agent_1 c))
    :effect (and
             (not (on-disk c d))
             (on-peg c middle)
             (not (clear-peg middle))
             (clear-disk d)
             (not (at s3)) (at s4))
  )

  ;; 5: agent_1: A right -> left (onto disk D)
  (:action move-agent1-a-right-left-onto-d
    :precondition (and (at s4)
                       (on-disk a b)
                       (clear-disk a)
                       (on-disk d e)
                       (clear-disk d)
                       (can-move agent_1 a))
    :effect (and
             (not (on-disk a b))
             (on-disk a d)
             (clear-disk b)
             (not (clear-disk d))
             (not (at s4)) (at s5))
  )

  ;; 6: agent_1: B right -> middle (onto disk C)
  (:action move-agent1-b-right-middle-onto-c
    :precondition (and (at s5)
                       (on-peg b right)
                       (clear-disk b)
                       (on-peg c middle)
                       (clear-disk c)
                       (can-move agent_1 b))
    :effect (and
             (not (on-peg b right))
             (on-disk b c)
             (clear-peg right)
             (not (clear-disk c))
             (not (at s5)) (at s6))
  )

  ;; 7: agent_1: A left -> middle (onto disk B)
  (:action move-agent1-a-left-middle-onto-b
    :precondition (and (at s6)
                       (on-disk a d)
                       (clear-disk a)
                       (on-disk b c)
                       (clear-disk b)
                       (can-move agent_1 a))
    :effect (and
             (not (on-disk a d))
             (on-disk a b)
             (clear-disk d)
             (not (clear-disk b))
             (not (at s6)) (at s7))
  )

  ;; 8: agent_1: D left -> right (peg empty)
  (:action move-agent1-d-left-right
    :precondition (and (at s7)
                       (on-disk d e)
                       (clear-disk d)
                       (clear-peg right)
                       (can-move agent_1 d))
    :effect (and
             (not (on-disk d e))
             (on-peg d right)
             (not (clear-peg right))
             (clear-disk e)
             (not (at s7)) (at s8))
  )

  ;; 9: agent_1: A middle -> right (onto disk D)
  (:action move-agent1-a-middle-right-onto-d
    :precondition (and (at s8)
                       (on-disk a b)
                       (clear-disk a)
                       (on-peg d right)
                       (clear-disk d)
                       (can-move agent_1 a))
    :effect (and
             (not (on-disk a b))
             (on-disk a d)
             (clear-disk b)
             (not (clear-disk d))
             (not (at s8)) (at s9))
  )

  ;; 10: agent_1: B middle -> left (onto disk E)
  (:action move-agent1-b-middle-left-onto-e
    :precondition (and (at s9)
                       (on-disk b c)
                       (clear-disk b)
                       (on-disk e f)
                       (clear-disk e)
                       (can-move agent_1 b))
    :effect (and
             (not (on-disk b c))
             (on-disk b e)
             (clear-disk c)
             (not (clear-disk e))
             (not (at s9)) (at s10))
  )

  ;; 11: agent_1: A right -> left (onto disk B)
  (:action move-agent1-a-right-left-onto-b
    :precondition (and (at s10)
                       (on-disk a d)
                       (clear-disk a)
                       (on-disk b e)
                       (clear-disk b)
                       (can-move agent_1 a))
    :effect (and
             (not (on-disk a d))
             (on-disk a b)
             (clear-disk d)
             (not (clear-disk b))
             (not (at s10)) (at s11))
  )

  ;; 12: agent_1: C middle -> right (onto disk D)  -- finalizing
  (:action move-agent1-c-middle-right-onto-d
    :precondition (and (at s11)
                       (on-peg c middle)
                       (clear-disk c)
                       (on-peg d right)
                       (clear-disk d)
                       (can-move agent_1 c))
    :effect (and
             (not (on-peg c middle))
             (on-disk c d)
             (clear-peg middle)
             (not (clear-disk d))
             (not (at s11)) (at s12))
  )

)