(define (domain tower-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on ?d - disk ?under - disk)
    (on-peg ?d - disk ?p - peg)

    (clear-disk ?d - disk)
    (clear-peg ?p - peg)

    (smaller ?smaller - disk ?larger - disk)

    (next ?s - stage ?s2 - stage)
    (current ?s - stage)
  )

  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
                    (on ?d ?from)
                    (clear-disk ?d)
                    (clear-disk ?to)
                    (smaller ?d ?to)
                    (current ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (clear-disk ?from)
              (not (clear-disk ?to))
              (clear-disk ?d)
              (not (current ?s))
              (current ?s2)
            )
  )

  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
                    (on ?d ?from)
                    (clear-disk ?d)
                    (clear-peg ?to)
                    (current ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              (not (on ?d ?from))
              (on-peg ?d ?to)
              (clear-disk ?from)
              (not (clear-peg ?to))
              (clear-disk ?d)
              (not (current ?s))
              (current ?s2)
            )
  )

  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
                    (on-peg ?d ?from)
                    (clear-disk ?d)
                    (clear-disk ?to)
                    (smaller ?d ?to)
                    (current ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              (not (on-peg ?d ?from))
              (on ?d ?to)
              (clear-peg ?from)
              (not (clear-disk ?to))
              (clear-disk ?d)
              (not (current ?s))
              (current ?s2)
            )
  )

  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
                    (on-peg ?d ?from)
                    (clear-disk ?d)
                    (clear-peg ?to)
                    (current ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              (not (on-peg ?d ?from))
              (on-peg ?d ?to)
              (clear-peg ?from)
              (not (clear-peg ?to))
              (clear-disk ?d)
              (not (current ?s))
              (current ?s2)
            )
  )
)