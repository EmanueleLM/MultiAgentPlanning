(define (domain Hanoi3Agents15DisksInstance15)
  (:requirements :typing :negative-preconditions :strips)
  (:types disk peg - place)
  (:predicates
    (on ?d - disk ?s - place)            ; disk ?d is directly on place ?s (disk or peg)
    (top ?d - disk ?p - peg)            ; disk ?d is the top disk of peg ?p
    (empty ?p - peg)                    ; peg ?p has no disks
    (can-move-agent1 ?d - disk)
    (can-move-agent2 ?d - disk)
    (can-move-agent3 ?d - disk)
    (smaller ?a - disk ?b - disk)       ; ?a is strictly smaller than ?b
  )

  ;; Agent 1 actions (allowed disks: A,B,C,D,E)
  ;; Case: the disk is currently on another disk (?under is disk) and target peg is empty
  (:action move-agent1-from-disk-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?under - disk)
    :precondition (and
                    (can-move-agent1 ?d)
                    (on ?d ?under)
                    (top ?d ?from)
                    (empty ?to)
                   )
    :effect (and
              (not (on ?d ?under))
              (on ?d ?to)
              (not (top ?d ?from))
              (top ?d ?to)
              (top ?under ?from)    ; disk under becomes new top of the from-peg
              (not (empty ?to))
             )
  )

  ;; Case: disk is on another disk and target peg has a top disk ?t (non-empty)
  (:action move-agent1-from-disk-to-nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?under - disk ?t - disk)
    :precondition (and
                    (can-move-agent1 ?d)
                    (on ?d ?under)
                    (top ?d ?from)
                    (top ?t ?to)
                    (smaller ?d ?t)
                   )
    :effect (and
              (not (on ?d ?under))
              (on ?d ?to)
              (not (top ?t ?to))
              (top ?d ?to)
              (not (top ?d ?from))
              (top ?under ?from)
             )
  )

  ;; Case: disk is directly on the peg (?under is peg) and target peg is empty
  (:action move-agent1-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?under - peg)
    :precondition (and
                    (can-move-agent1 ?d)
                    (on ?d ?under)
                    (top ?d ?from)
                    (empty ?to)
                   )
    :effect (and
              (not (on ?d ?under))
              (on ?d ?to)
              (not (top ?d ?from))
              (top ?d ?to)
              (empty ?from)         ; from-peg becomes empty
              (not (empty ?to))
             )
  )

  ;; Case: disk is directly on the peg (?under is peg) and target peg non-empty (has top ?t)
  (:action move-agent1-from-peg-to-nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?under - peg ?t - disk)
    :precondition (and
                    (can-move-agent1 ?d)
                    (on ?d ?under)
                    (top ?d ?from)
                    (top ?t ?to)
                    (smaller ?d ?t)
                   )
    :effect (and
              (not (on ?d ?under))
              (on ?d ?to)
              (not (top ?t ?to))
              (top ?d ?to)
              (not (top ?d ?from))
              (empty ?from)
             )
  )

  ;; Agent 2 actions (allowed disks: F,G,H,I,J)
  (:action move-agent2-from-disk-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?under - disk)
    :precondition (and (can-move-agent2 ?d) (on ?d ?under) (top ?d ?from) (empty ?to))
    :effect (and (not (on ?d ?under)) (on ?d ?to) (not (top ?d ?from)) (top ?d ?to) (top ?under ?from) (not (empty ?to)))
  )

  (:action move-agent2-from-disk-to-nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?under - disk ?t - disk)
    :precondition (and (can-move-agent2 ?d) (on ?d ?under) (top ?d ?from) (top ?t ?to) (smaller ?d ?t))
    :effect (and (not (on ?d ?under)) (on ?d ?to) (not (top ?t ?to)) (top ?d ?to) (not (top ?d ?from)) (top ?under ?from))
  )

  (:action move-agent2-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?under - peg)
    :precondition (and (can-move-agent2 ?d) (on ?d ?under) (top ?d ?from) (empty ?to))
    :effect (and (not (on ?d ?under)) (on ?d ?to) (not (top ?d ?from)) (top ?d ?to) (empty ?from) (not (empty ?to)))
  )

  (:action move-agent2-from-peg-to-nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?under - peg ?t - disk)
    :precondition (and (can-move-agent2 ?d) (on ?d ?under) (top ?d ?from) (top ?t ?to) (smaller ?d ?t))
    :effect (and (not (on ?d ?under)) (on ?d ?to) (not (top ?t ?to)) (top ?d ?to) (not (top ?d ?from)) (empty ?from))
  )

  ;; Agent 3 actions (allowed disks: K,L,M,N,O)
  (:action move-agent3-from-disk-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?under - disk)
    :precondition (and (can-move-agent3 ?d) (on ?d ?under) (top ?d ?from) (empty ?to))
    :effect (and (not (on ?d ?under)) (on ?d ?to) (not (top ?d ?from)) (top ?d ?to) (top ?under ?from) (not (empty ?to)))
  )

  (:action move-agent3-from-disk-to-nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?under - disk ?t - disk)
    :precondition (and (can-move-agent3 ?d) (on ?d ?under) (top ?d ?from) (top ?t ?to) (smaller ?d ?t))
    :effect (and (not (on ?d ?under)) (on ?d ?to) (not (top ?t ?to)) (top ?d ?to) (not (top ?d ?from)) (top ?under ?from))
  )

  (:action move-agent3-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?under - peg)
    :precondition (and (can-move-agent3 ?d) (on ?d ?under) (top ?d ?from) (empty ?to))
    :effect (and (not (on ?d ?under)) (on ?d ?to) (not (top ?d ?from)) (top ?d ?to) (empty ?from) (not (empty ?to)))
  )

  (:action move-agent3-from-peg-to-nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?under - peg ?t - disk)
    :precondition (and (can-move-agent3 ?d) (on ?d ?under) (top ?d ?from) (top ?t ?to) (smaller ?d ?t))
    :effect (and (not (on ?d ?under)) (on ?d ?to) (not (top ?t ?to)) (top ?d ?to) (not (top ?d ?from)) (empty ?from))
  )
)