(define (domain hanoi)
  (:requirements :typing :strips :negative-preconditions)
  (:types disk peg - support step)

  (:predicates
    (on ?d - disk ?s - support ?t - step)
    (clear ?s - support ?t - step)
    (next ?t1 - step ?t2 - step)
    (moved ?t - step)
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move disk A to an empty peg
  (:action move-A-to-peg
    :parameters (?from - support ?to - peg ?t - step ?t2 - step
                 ?sB - support ?sC - support ?sD - support ?sE - support)
    :precondition (and
      (on A ?from ?t)
      (clear A ?t)
      (clear ?to ?t)
      (on B ?sB ?t)
      (on C ?sC ?t)
      (on D ?sD ?t)
      (on E ?sE ?t)
      (next ?t ?t2)
      (not (moved ?t))
    )
    :effect (and
      ;; copy positions to next step, but A moves
      (on A ?to ?t2)
      (on B ?sB ?t2)
      (on C ?sC ?t2)
      (on D ?sD ?t2)
      (on E ?sE ?t2)

      ;; initialize clears at t2
      (clear left ?t2) (clear middle ?t2) (clear right ?t2)
      (clear A ?t2) (clear B ?t2) (clear C ?t2) (clear D ?t2) (clear E ?t2)

      ;; delete clears for supports that are occupied at t2
      (not (clear ?to ?t2))
      (not (clear ?sB ?t2))
      (not (clear ?sC ?t2))
      (not (clear ?sD ?t2))
      (not (clear ?sE ?t2))

      (moved ?t)
    )
  )

  ;; Move disk A onto a disk (requires size ordering)
  (:action move-A-onto-disk
    :parameters (?from - support ?to - disk ?t - step ?t2 - step
                 ?sB - support ?sC - support ?sD - support ?sE - support)
    :precondition (and
      (on A ?from ?t)
      (clear A ?t)
      (clear ?to ?t)
      (smaller A ?to)
      (on B ?sB ?t)
      (on C ?sC ?t)
      (on D ?sD ?t)
      (on E ?sE ?t)
      (next ?t ?t2)
      (not (moved ?t))
    )
    :effect (and
      (on A ?to ?t2)
      (on B ?sB ?t2)
      (on C ?sC ?t2)
      (on D ?sD ?t2)
      (on E ?sE ?t2)

      (clear left ?t2) (clear middle ?t2) (clear right ?t2)
      (clear A ?t2) (clear B ?t2) (clear C ?t2) (clear D ?t2) (clear E ?t2)

      (not (clear ?to ?t2))
      (not (clear ?sB ?t2))
      (not (clear ?sC ?t2))
      (not (clear ?sD ?t2))
      (not (clear ?sE ?t2))

      (moved ?t)
    )
  )

  ;; Move disk B to an empty peg
  (:action move-B-to-peg
    :parameters (?from - support ?to - peg ?t - step ?t2 - step
                 ?sA - support ?sC - support ?sD - support ?sE - support)
    :precondition (and
      (on B ?from ?t)
      (clear B ?t)
      (clear ?to ?t)
      (on A ?sA ?t)
      (on C ?sC ?t)
      (on D ?sD ?t)
      (on E ?sE ?t)
      (next ?t ?t2)
      (not (moved ?t))
    )
    :effect (and
      (on B ?to ?t2)
      (on A ?sA ?t2)
      (on C ?sC ?t2)
      (on D ?sD ?t2)
      (on E ?sE ?t2)

      (clear left ?t2) (clear middle ?t2) (clear right ?t2)
      (clear A ?t2) (clear B ?t2) (clear C ?t2) (clear D ?t2) (clear E ?t2)

      (not (clear ?to ?t2))
      (not (clear ?sA ?t2))
      (not (clear ?sC ?t2))
      (not (clear ?sD ?t2))
      (not (clear ?sE ?t2))

      (moved ?t)
    )
  )

  ;; Move disk B onto a disk (requires size ordering)
  (:action move-B-onto-disk
    :parameters (?from - support ?to - disk ?t - step ?t2 - step
                 ?sA - support ?sC - support ?sD - support ?sE - support)
    :precondition (and
      (on B ?from ?t)
      (clear B ?t)
      (clear ?to ?t)
      (smaller B ?to)
      (on A ?sA ?t)
      (on C ?sC ?t)
      (on D ?sD ?t)
      (on E ?sE ?t)
      (next ?t ?t2)
      (not (moved ?t))
    )
    :effect (and
      (on B ?to ?t2)
      (on A ?sA ?t2)
      (on C ?sC ?t2)
      (on D ?sD ?t2)
      (on E ?sE ?t2)

      (clear left ?t2) (clear middle ?t2) (clear right ?t2)
      (clear A ?t2) (clear B ?t2) (clear C ?t2) (clear D ?t2) (clear E ?t2)

      (not (clear ?to ?t2))
      (not (clear ?sA ?t2))
      (not (clear ?sC ?t2))
      (not (clear ?sD ?t2))
      (not (clear ?sE ?t2))

      (moved ?t)
    )
  )

  ;; Move disk C to an empty peg
  (:action move-C-to-peg
    :parameters (?from - support ?to - peg ?t - step ?t2 - step
                 ?sA - support ?sB - support ?sD - support ?sE - support)
    :precondition (and
      (on C ?from ?t)
      (clear C ?t)
      (clear ?to ?t)
      (on A ?sA ?t)
      (on B ?sB ?t)
      (on D ?sD ?t)
      (on E ?sE ?t)
      (next ?t ?t2)
      (not (moved ?t))
    )
    :effect (and
      (on C ?to ?t2)
      (on A ?sA ?t2)
      (on B ?sB ?t2)
      (on D ?sD ?t2)
      (on E ?sE ?t2)

      (clear left ?t2) (clear middle ?t2) (clear right ?t2)
      (clear A ?t2) (clear B ?t2) (clear C ?t2) (clear D ?t2) (clear E ?t2)

      (not (clear ?to ?t2))
      (not (clear ?sA ?t2))
      (not (clear ?sB ?t2))
      (not (clear ?sD ?t2))
      (not (clear ?sE ?t2))

      (moved ?t)
    )
  )

  ;; Move disk C onto a disk (requires size ordering)
  (:action move-C-onto-disk
    :parameters (?from - support ?to - disk ?t - step ?t2 - step
                 ?sA - support ?sB - support ?sD - support ?sE - support)
    :precondition (and
      (on C ?from ?t)
      (clear C ?t)
      (clear ?to ?t)
      (smaller C ?to)
      (on A ?sA ?t)
      (on B ?sB ?t)
      (on D ?sD ?t)
      (on E ?sE ?t)
      (next ?t ?t2)
      (not (moved ?t))
    )
    :effect (and
      (on C ?to ?t2)
      (on A ?sA ?t2)
      (on B ?sB ?t2)
      (on D ?sD ?t2)
      (on E ?sE ?t2)

      (clear left ?t2) (clear middle ?t2) (clear right ?t2)
      (clear A ?t2) (clear B ?t2) (clear C ?t2) (clear D ?t2) (clear E ?t2)

      (not (clear ?to ?t2))
      (not (clear ?sA ?t2))
      (not (clear ?sB ?t2))
      (not (clear ?sD ?t2))
      (not (clear ?sE ?t2))

      (moved ?t)
    )
  )

  ;; Move disk D to an empty peg
  (:action move-D-to-peg
    :parameters (?from - support ?to - peg ?t - step ?t2 - step
                 ?sA - support ?sB - support ?sC - support ?sE - support)
    :precondition (and
      (on D ?from ?t)
      (clear D ?t)
      (clear ?to ?t)
      (on A ?sA ?t)
      (on B ?sB ?t)
      (on C ?sC ?t)
      (on E ?sE ?t)
      (next ?t ?t2)
      (not (moved ?t))
    )
    :effect (and
      (on D ?to ?t2)
      (on A ?sA ?t2)
      (on B ?sB ?t2)
      (on C ?sC ?t2)
      (on E ?sE ?t2)

      (clear left ?t2) (clear middle ?t2) (clear right ?t2)
      (clear A ?t2) (clear B ?t2) (clear C ?t2) (clear D ?t2) (clear E ?t2)

      (not (clear ?to ?t2))
      (not (clear ?sA ?t2))
      (not (clear ?sB ?t2))
      (not (clear ?sC ?t2))
      (not (clear ?sE ?t2))

      (moved ?t)
    )
  )

  ;; Move disk D onto a disk (requires size ordering)
  (:action move-D-onto-disk
    :parameters (?from - support ?to - disk ?t - step ?t2 - step
                 ?sA - support ?sB - support ?sC - support ?sE - support)
    :precondition (and
      (on D ?from ?t)
      (clear D ?t)
      (clear ?to ?t)
      (smaller D ?to)
      (on A ?sA ?t)
      (on B ?sB ?t)
      (on C ?sC ?t)
      (on E ?sE ?t)
      (next ?t ?t2)
      (not (moved ?t))
    )
    :effect (and
      (on D ?to ?t2)
      (on A ?sA ?t2)
      (on B ?sB ?t2)
      (on C ?sC ?t2)
      (on E ?sE ?t2)

      (clear left ?t2) (clear middle ?t2) (clear right ?t2)
      (clear A ?t2) (clear B ?t2) (clear C ?t2) (clear D ?t2) (clear E ?t2)

      (not (clear ?to ?t2))
      (not (clear ?sA ?t2))
      (not (clear ?sB ?t2))
      (not (clear ?sC ?t2))
      (not (clear ?sE ?t2))

      (moved ?t)
    )
  )

  ;; Move disk E to an empty peg
  (:action move-E-to-peg
    :parameters (?from - support ?to - peg ?t - step ?t2 - step
                 ?sA - support ?sB - support ?sC - support ?sD - support)
    :precondition (and
      (on E ?from ?t)
      (clear E ?t)
      (clear ?to ?t)
      (on A ?sA ?t)
      (on B ?sB ?t)
      (on C ?sC ?t)
      (on D ?sD ?t)
      (next ?t ?t2)
      (not (moved ?t))
    )
    :effect (and
      (on E ?to ?t2)
      (on A ?sA ?t2)
      (on B ?sB ?t2)
      (on C ?sC ?t2)
      (on D ?sD ?t2)

      (clear left ?t2) (clear middle ?t2) (clear right ?t2)
      (clear A ?t2) (clear B ?t2) (clear C ?t2) (clear D ?t2) (clear E ?t2)

      (not (clear ?to ?t2))
      (not (clear ?sA ?t2))
      (not (clear ?sB ?t2))
      (not (clear ?sC ?t2))
      (not (clear ?sD ?t2))

      (moved ?t)
    )
  )

  ;; Move disk E onto a disk (requires size ordering)
  (:action move-E-onto-disk
    :parameters (?from - support ?to - disk ?t - step ?t2 - step
                 ?sA - support ?sB - support ?sC - support ?sD - support)
    :precondition (and
      (on E ?from ?t)
      (clear E ?t)
      (clear ?to ?t)
      (smaller E ?to)
      (on A ?sA ?t)
      (on B ?sB ?t)
      (on C ?sC ?t)
      (on D ?sD ?t)
      (next ?t ?t2)
      (not (moved ?t))
    )
    :effect (and
      (on E ?to ?t2)
      (on A ?sA ?t2)
      (on B ?sB ?t2)
      (on C ?sC ?t2)
      (on D ?sD ?t2)

      (clear left ?t2) (clear middle ?t2) (clear right ?t2)
      (clear A ?t2) (clear B ?t2) (clear C ?t2) (clear D ?t2) (clear E ?t2)

      (not (clear ?to ?t2))
      (not (clear ?sA ?t2))
      (not (clear ?sB ?t2))
      (not (clear ?sC ?t2))
      (not (clear ?sD ?t2))

      (moved ?t)
    )
  )
)