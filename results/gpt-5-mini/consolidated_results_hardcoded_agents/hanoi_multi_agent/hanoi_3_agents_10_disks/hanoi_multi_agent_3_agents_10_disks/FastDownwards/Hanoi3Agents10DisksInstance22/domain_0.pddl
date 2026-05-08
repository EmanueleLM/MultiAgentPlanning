(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    peg - place
    disk - place
    disk_a disk_b disk_c - disk
    agent
  )

  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (no-move ?a - agent)
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Agent 1 actions (may move disks A..D = disk_a)
  (:action move-agent1-to-peg
    :parameters (?d - disk_a ?from - place ?to - peg)
    :precondition (and
                    (clear ?d)
                    (on ?d ?from)
                    (clear ?to)
                    (not (no-move agent1))
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
              (clear ?d)
            )
  )

  (:action move-agent1-to-disk
    :parameters (?d - disk_a ?from - place ?to - disk)
    :precondition (and
                    (clear ?d)
                    (on ?d ?from)
                    (clear ?to)
                    (smaller ?d ?to)
                    (not (no-move agent1))
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
              (clear ?d)
            )
  )

  ;; Agent 2 actions (may move disks E..G = disk_b)
  (:action move-agent2-to-peg
    :parameters (?d - disk_b ?from - place ?to - peg)
    :precondition (and
                    (clear ?d)
                    (on ?d ?from)
                    (clear ?to)
                    (not (no-move agent2))
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
              (clear ?d)
            )
  )

  (:action move-agent2-to-disk
    :parameters (?d - disk_b ?from - place ?to - disk)
    :precondition (and
                    (clear ?d)
                    (on ?d ?from)
                    (clear ?to)
                    (smaller ?d ?to)
                    (not (no-move agent2))
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
              (clear ?d)
            )
  )

  ;; Agent 3 actions (may move disks H..J = disk_c)
  (:action move-agent3-to-peg
    :parameters (?d - disk_c ?from - place ?to - peg)
    :precondition (and
                    (clear ?d)
                    (on ?d ?from)
                    (clear ?to)
                    (not (no-move agent3))
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
              (clear ?d)
            )
  )

  (:action move-agent3-to-disk
    :parameters (?d - disk_c ?from - place ?to - disk)
    :precondition (and
                    (clear ?d)
                    (on ?d ?from)
                    (clear ?to)
                    (smaller ?d ?to)
                    (not (no-move agent3))
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
              (clear ?d)
            )
  )
)