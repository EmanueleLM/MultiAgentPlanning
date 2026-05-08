(define (domain hanoi-7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on ?d - disk ?p - peg)
    (directly-on-disk ?u - disk ?l - disk ?p - peg)
    (directly-on-peg ?d - disk ?p - peg)
    (top ?p - peg ?d - disk)
    (empty ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
    (step-ready ?s - step)
    (step-next ?s1 - step ?s2 - step)
    (done ?s - step)
  )

  (:action move-disk-from-disk-to-disk
    :parameters (?s - step ?d - disk ?from - peg ?to - peg ?below - disk ?desttop - disk ?snext - step)
    :precondition (and
      (step-ready ?s)
      (top ?from ?d)
      (directly-on-disk ?d ?below ?from)
      (top ?to ?desttop)
      (smaller ?d ?desttop)
      (step-next ?s ?snext)
    )
    :effect (and
      (not (top ?from ?d))
      (not (directly-on-disk ?d ?below ?from))
      (top ?from ?below)

      (not (top ?to ?desttop))
      (directly-on-disk ?d ?desttop ?to)
      (top ?to ?d)

      (not (on ?d ?from))
      (on ?d ?to)

      (done ?s)
      (not (step-ready ?s))
      (step-ready ?snext)
    )
  )

  (:action move-disk-from-disk-to-disk-final
    :parameters (?s - step ?d - disk ?from - peg ?to - peg ?below - disk ?desttop - disk)
    :precondition (and
      (step-ready ?s)
      (top ?from ?d)
      (directly-on-disk ?d ?below ?from)
      (top ?to ?desttop)
      (smaller ?d ?desttop)
    )
    :effect (and
      (not (top ?from ?d))
      (not (directly-on-disk ?d ?below ?from))
      (top ?from ?below)

      (not (top ?to ?desttop))
      (directly-on-disk ?d ?desttop ?to)
      (top ?to ?d)

      (not (on ?d ?from))
      (on ?d ?to)

      (done ?s)
      (not (step-ready ?s))
    )
  )

  (:action move-disk-from-disk-to-empty
    :parameters (?s - step ?d - disk ?from - peg ?to - peg ?below - disk ?snext - step)
    :precondition (and
      (step-ready ?s)
      (top ?from ?d)
      (directly-on-disk ?d ?below ?from)
      (empty ?to)
      (step-next ?s ?snext)
    )
    :effect (and
      (not (top ?from ?d))
      (not (directly-on-disk ?d ?below ?from))
      (top ?from ?below)

      (not (empty ?to))
      (directly-on-peg ?d ?to)
      (top ?to ?d)

      (not (on ?d ?from))
      (on ?d ?to)

      (done ?s)
      (not (step-ready ?s))
      (step-ready ?snext)
    )
  )

  (:action move-disk-from-disk-to-empty-final
    :parameters (?s - step ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (step-ready ?s)
      (top ?from ?d)
      (directly-on-disk ?d ?below ?from)
      (empty ?to)
    )
    :effect (and
      (not (top ?from ?d))
      (not (directly-on-disk ?d ?below ?from))
      (top ?from ?below)

      (not (empty ?to))
      (directly-on-peg ?d ?to)
      (top ?to ?d)

      (not (on ?d ?from))
      (on ?d ?to)

      (done ?s)
      (not (step-ready ?s))
    )
  )

  (:action move-disk-from-peg-to-disk
    :parameters (?s - step ?d - disk ?from - peg ?to - peg ?desttop - disk ?snext - step)
    :precondition (and
      (step-ready ?s)
      (top ?from ?d)
      (directly-on-peg ?d ?from)
      (top ?to ?desttop)
      (smaller ?d ?desttop)
      (step-next ?s ?snext)
    )
    :effect (and
      (not (top ?from ?d))
      (not (directly-on-peg ?d ?from))
      (empty ?from)

      (not (top ?to ?desttop))
      (directly-on-disk ?d ?desttop ?to)
      (top ?to ?d)

      (not (on ?d ?from))
      (on ?d ?to)

      (done ?s)
      (not (step-ready ?s))
      (step-ready ?snext)
    )
  )

  (:action move-disk-from-peg-to-disk-final
    :parameters (?s - step ?d - disk ?from - peg ?to - peg ?desttop - disk)
    :precondition (and
      (step-ready ?s)
      (top ?from ?d)
      (directly-on-peg ?d ?from)
      (top ?to ?desttop)
      (smaller ?d ?desttop)
    )
    :effect (and
      (not (top ?from ?d))
      (not (directly-on-peg ?d ?from))
      (empty ?from)

      (not (top ?to ?desttop))
      (directly-on-disk ?d ?desttop ?to)
      (top ?to ?d)

      (not (on ?d ?from))
      (on ?d ?to)

      (done ?s)
      (not (step-ready ?s))
    )
  )

  (:action move-disk-from-peg-to-empty
    :parameters (?s - step ?d - disk ?from - peg ?to - peg ?snext - step)
    :precondition (and
      (step-ready ?s)
      (top ?from ?d)
      (directly-on-peg ?d ?from)
      (empty ?to)
      (step-next ?s ?snext)
    )
    :effect (and
      (not (top ?from ?d))
      (not (directly-on-peg ?d ?from))
      (empty ?from)

      (not (empty ?to))
      (directly-on-peg ?d ?to)
      (top ?to ?d)

      (not (on ?d ?from))
      (on ?d ?to)

      (done ?s)
      (not (step-ready ?s))
      (step-ready ?snext)
    )
  )

  (:action move-disk-from-peg-to-empty-final
    :parameters (?s - step ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (step-ready ?s)
      (top ?from ?d)
      (directly-on-peg ?d ?from)
      (empty ?to)
    )
    :effect (and
      (not (top ?from ?d))
      (not (directly-on-peg ?d ?from))
      (empty ?from)

      (not (empty ?to))
      (directly-on-peg ?d ?to)
      (top ?to ?d)

      (not (on ?d ?from))
      (on ?d ?to)

      (done ?s)
      (not (step-ready ?s))
    )
  )
)