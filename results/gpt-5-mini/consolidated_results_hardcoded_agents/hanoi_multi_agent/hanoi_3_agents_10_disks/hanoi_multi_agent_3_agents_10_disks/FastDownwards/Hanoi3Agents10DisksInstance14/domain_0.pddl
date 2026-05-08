(define (domain hanoi-multiagent)
  (:requirements :strips)
  (:predicates
    (on ?d ?x)                 ; disk ?d is directly on object ?x (disk or peg)
    (clear ?x)                 ; nothing is on top of object ?x (disk or peg)
    (smaller ?d1 ?d2)          ; disk ?d1 is smaller than disk ?d2
    (agent1-disk ?d)           ; disk ?d may be moved by agent_1
    (agent2-disk ?d)           ; disk ?d may be moved by agent_2
    (agent3-disk ?d)           ; disk ?d may be moved by agent_3
    (disk ?d)                  ; type predicate: object ?d is a disk
    (peg ?p)                   ; type predicate: object ?p is a peg
  )

  ;; Agent 1 actions: may move disks A, B, C, D only
  (:action move-agent1-to-peg
    :parameters (?d ?from ?to)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (peg ?to) (agent1-disk ?d))
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  (:action move-agent1-to-disk
    :parameters (?d ?from ?to)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (disk ?to) (smaller ?d ?to) (agent1-disk ?d))
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  ;; Agent 2 actions: may move disks E, F, G only
  (:action move-agent2-to-peg
    :parameters (?d ?from ?to)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (peg ?to) (agent2-disk ?d))
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  (:action move-agent2-to-disk
    :parameters (?d ?from ?to)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (disk ?to) (smaller ?d ?to) (agent2-disk ?d))
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  ;; Agent 3 actions: may move disks H, I, J only
  (:action move-agent3-to-peg
    :parameters (?d ?from ?to)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (peg ?to) (agent3-disk ?d))
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  (:action move-agent3-to-disk
    :parameters (?d ?from ?to)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (disk ?to) (smaller ?d ?to) (agent3-disk ?d))
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )
)