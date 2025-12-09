(define (domain hanoi-7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?below - disk ?p - peg)
    (top ?p - peg ?d - disk)
    (empty ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
    (step-ready ?s - step)
    (step-next ?s1 - step ?s2 - step)
    (done ?s - step)
  )

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
      (not (on-peg ?d ?from))
      (not (top ?from ?d))
      (empty ?from)

      (not (empty ?to))
      (on-peg ?d ?to)
      (top ?to ?d)

      (done ?s)
      (not (step-ready ?s))
      (step-ready ?snext)
    )
  )

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
      (not (on-disk ?d ?below ?from))
      (not (top ?from ?d))
      (top ?from ?below)

      (not (empty ?to))
      (on-peg ?d ?to)
      (top ?to ?d)

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
      (not (on-peg ?d ?from))
      (not (top ?from ?d))
      (empty ?from)

      (not (top ?to ?desttop))
      (on-disk ?d ?desttop ?to)
      (top ?to ?d)

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
      (not (on-disk ?d ?below ?from))
      (not (top ?from ?d))
      (top ?from ?below)

      (not (top ?to ?desttop))
      (on-disk ?d ?desttop ?to)
      (top ?to ?d)

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