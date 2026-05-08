(define (domain hanoi-7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; disk d is directly on peg p (used for bottom disks)
    (on-peg ?d - disk ?p - peg)
    ;; disk d is directly on disk below at peg p
    (on-disk ?d - disk ?below - disk ?p - peg)
    ;; the top disk on peg p is d
    (top ?p - peg ?d - disk)
    ;; peg p is empty (no disks)
    (empty ?p - peg)
    ;; size ordering: d1 is smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; sequencing of steps
    (step-ready ?s - step)
    (step-next ?s1 - step ?s2 - step)
    (done ?s - step)
  )

  ;; Move a top disk that is the only disk on its source peg onto an empty destination peg (with next step)
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
      ;; remove from source peg
      (not (on-peg ?d ?from))
      (not (top ?from ?d))
      (empty ?from)

      ;; place on destination peg as bottom disk
      (not (empty ?to))
      (on-peg ?d ?to)
      (top ?to ?d)

      ;; sequencing
      (done ?s)
      (not (step-ready ?s))
      (step-ready ?snext)
    )
  )

  ;; Final variant without producing a next ready step
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

  ;; Move a top disk that is on another disk (source has a below disk) onto an empty destination peg (with next)
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
      ;; remove d from being on below at source
      (not (on-disk ?d ?below ?from))
      (not (top ?from ?d))
      ;; below becomes top on the same peg
      (top ?from ?below)

      ;; place d on destination peg as bottom disk
      (not (empty ?to))
      (on-peg ?d ?to)
      (top ?to ?d)

      ;; sequencing
      (done ?s)
      (not (step-ready ?s))
      (step-ready ?snext)
    )
  )

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

  ;; Move a top disk that is the only disk on its source peg onto another peg where the top is a disk (with next)
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

      ;; place on top of desttop; desttop remains on-peg or on-disk as before
      (not (top ?to ?desttop))
      (on-disk ?d ?desttop ?to)
      (top ?to ?d)

      ;; sequencing
      (done ?s)
      (not (step-ready ?s))
      (step-ready ?snext)
    )
  )

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

  ;; Move a top disk that is on another disk to land on another disk (both source and dest have below disks) (with next)
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
      ;; remove from source stack
      (not (on-disk ?d ?below ?from))
      (not (top ?from ?d))
      (top ?from ?below)

      ;; place on destination stack
      (not (top ?to ?desttop))
      (on-disk ?d ?desttop ?to)
      (top ?to ?d)

      ;; sequencing
      (done ?s)
      (not (step-ready ?s))
      (step-ready ?snext)
    )
  )

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