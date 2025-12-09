(define (domain hanoi-7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; direct placement relationships
    (on-peg ?d - disk ?p - peg)        ;; ?d directly on top of peg ?p
    (on-disk ?d - disk ?below - disk ?p - peg) ;; ?d directly on top of disk ?below on peg ?p

    ;; top-of-stack and emptiness for pegs
    (top ?p - peg ?d - disk)          ;; ?d is the top disk on peg ?p
    (empty ?p - peg)                  ;; peg has no disks

    ;; size ordering (static)
    (smaller ?d1 - disk ?d2 - disk)

    ;; step sequencing / control
    (step-ready ?s - step)            ;; this step may be executed now
    (step-next ?s1 - step ?s2 - step) ;; successor relation between steps
    (done ?s - step)                  ;; step executed/consumed
  )

  ;; Move a disk that is directly on a peg to an empty peg, with a next-step
  (:action move-from-peg-to-empty
    :parameters (?s - step ?d - disk ?from - peg ?to - peg ?snext - step)
    :precondition (and
      (step-ready ?s)
      (on-peg ?d ?from)
      (top ?from ?d)
      (empty ?to)
      (step-next ?s ?snext)
    )
    :effect (and
      ;; remove disk from source peg
      (not (on-peg ?d ?from))
      (not (top ?from ?d))
      ;; source peg becomes empty
      (empty ?from)

      ;; place disk on destination peg as top
      (not (empty ?to))
      (on-peg ?d ?to)
      (top ?to ?d)

      ;; step control
      (done ?s)
      (not (step-ready ?s))
      (step-ready ?snext)
    )
  )

  ;; Move a disk that is directly on a peg to an empty peg, final step (no successor)
  (:action move-from-peg-to-empty-final
    :parameters (?s - step ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (step-ready ?s)
      (on-peg ?d ?from)
      (top ?from ?d)
      (empty ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (top ?from ?d))
      (empty ?from)

      (not (empty ?to))
      (on-peg ?d ?to)
      (top ?to ?d)

      (done ?s)
      (not (step-ready ?s))
    )
  )

  ;; Move a disk that is directly on another disk to an empty peg, with next-step
  (:action move-from-disk-to-empty
    :parameters (?s - step ?d - disk ?below - disk ?from - peg ?to - peg ?snext - step)
    :precondition (and
      (step-ready ?s)
      (on-disk ?d ?below ?from)
      (top ?from ?d)
      (empty ?to)
      (step-next ?s ?snext)
    )
    :effect (and
      ;; remove the moved disk from above the below-disk
      (not (on-disk ?d ?below ?from))
      (not (top ?from ?d))
      ;; the disk below becomes the new top on the source peg
      (top ?from ?below)

      ;; place moved disk on destination peg as top
      (not (empty ?to))
      (on-peg ?d ?to)
      (top ?to ?d)

      ;; step control
      (done ?s)
      (not (step-ready ?s))
      (step-ready ?snext)
    )
  )

  ;; Move a disk that is directly on another disk to an empty peg, final step
  (:action move-from-disk-to-empty-final
    :parameters (?s - step ?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (step-ready ?s)
      (on-disk ?d ?below ?from)
      (top ?from ?d)
      (empty ?to)
    )
    :effect (and
      (not (on-disk ?d ?below ?from))
      (not (top ?from ?d))
      (top ?from ?below)

      (not (empty ?to))
      (on-peg ?d ?to)
      (top ?to ?d)

      (done ?s)
      (not (step-ready ?s))
    )
  )

  ;; Move a disk that is directly on a peg onto another disk (stack on top), with next-step
  (:action move-from-peg-to-disk
    :parameters (?s - step ?d - disk ?from - peg ?to - peg ?desttop - disk ?snext - step)
    :precondition (and
      (step-ready ?s)
      (on-peg ?d ?from)
      (top ?from ?d)
      (top ?to ?desttop)
      (smaller ?d ?desttop)
      (step-next ?s ?snext)
    )
    :effect (and
      ;; remove from source peg
      (not (on-peg ?d ?from))
      (not (top ?from ?d))
      (empty ?from)

      ;; place on top of existing disk on destination peg
      (not (top ?to ?desttop))
      (on-disk ?d ?desttop ?to)
      (top ?to ?d)

      ;; step control
      (done ?s)
      (not (step-ready ?s))
      (step-ready ?snext)
    )
  )

  ;; Move a disk that is directly on a peg onto another disk, final step
  (:action move-from-peg-to-disk-final
    :parameters (?s - step ?d - disk ?from - peg ?to - peg ?desttop - disk)
    :precondition (and
      (step-ready ?s)
      (on-peg ?d ?from)
      (top ?from ?d)
      (top ?to ?desttop)
      (smaller ?d ?desttop)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (top ?from ?d))
      (empty ?from)

      (not (top ?to ?desttop))
      (on-disk ?d ?desttop ?to)
      (top ?to ?d)

      (done ?s)
      (not (step-ready ?s))
    )
  )

  ;; Move a disk that is directly on another disk onto another disk, with next-step
  (:action move-from-disk-to-disk
    :parameters (?s - step ?d - disk ?below - disk ?from - peg ?to - peg ?desttop - disk ?snext - step)
    :precondition (and
      (step-ready ?s)
      (on-disk ?d ?below ?from)
      (top ?from ?d)
      (top ?to ?desttop)
      (smaller ?d ?desttop)
      (step-next ?s ?snext)
    )
    :effect (and
      ;; remove moved disk from its source stack and expose the below disk as top
      (not (on-disk ?d ?below ?from))
      (not (top ?from ?d))
      (top ?from ?below)

      ;; place moved disk on destination disk
      (not (top ?to ?desttop))
      (on-disk ?d ?desttop ?to)
      (top ?to ?d)

      ;; step control
      (done ?s)
      (not (step-ready ?s))
      (step-ready ?snext)
    )
  )

  ;; Move a disk that is directly on another disk onto another disk, final step
  (:action move-from-disk-to-disk-final
    :parameters (?s - step ?d - disk ?below - disk ?from - peg ?to - peg ?desttop - disk)
    :precondition (and
      (step-ready ?s)
      (on-disk ?d ?below ?from)
      (top ?from ?d)
      (top ?to ?desttop)
      (smaller ?d ?desttop)
    )
    :effect (and
      (not (on-disk ?d ?below ?from))
      (not (top ?from ?d))
      (top ?from ?below)

      (not (top ?to ?desttop))
      (on-disk ?d ?desttop ?to)
      (top ?to ?d)

      (done ?s)
      (not (step-ready ?s))
    )
  )
)