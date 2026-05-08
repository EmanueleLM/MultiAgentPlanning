(define (domain hanoi7)
  (:requirements :strips :typing :negative-preconditions)
  (:types place - object
          disk peg - place
          step - object)

  (:predicates
    ;; disk d is directly on place p (place = disk or peg)
    (on ?d - disk ?p - place)
    ;; place (disk or peg) has nothing on top of it (for pegs = empty; for disks = top disk)
    (clear ?p - place)
    ;; size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; temporal progression control: current step and successor relation
    (current ?s - step)
    (next ?s1 - step ?s2 - step)
  )

  ;; Move a top disk from a peg onto an empty peg.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; destination peg now not empty
      (not (clear ?to))
      ;; source peg becomes empty
      (clear ?from)
      ;; advance time step
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from a disk onto an empty peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?under - disk ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?under)
      (clear ?d)
      (clear ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?under))
      (on ?d ?to)
      ;; destination peg now not empty
      (not (clear ?to))
      ;; disk under ?d becomes top
      (clear ?under)
      ;; advance time step
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from a peg onto a top disk (destination disk must be larger).
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; destination disk now has something on top
      (not (clear ?to))
      ;; source peg becomes empty
      (clear ?from)
      ;; advance time step
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from a disk onto a top disk (destination disk must be larger).
  (:action move-disk-to-disk
    :parameters (?d - disk ?under - disk ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?under)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?under))
      (on ?d ?to)
      ;; destination disk now has something on top
      (not (clear ?to))
      ;; disk under ?d becomes top
      (clear ?under)
      ;; advance time step
      (not (current ?s))
      (current ?s2)
    )
  )
)