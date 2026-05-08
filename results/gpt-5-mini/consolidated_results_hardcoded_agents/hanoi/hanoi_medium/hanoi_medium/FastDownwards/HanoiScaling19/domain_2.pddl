(define (domain hanoi)
  (:requirements :typing :strips :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; disk is immediately on a support (a disk or a peg) at a given step
    (at ?d - disk ?s - (either disk peg) ?t - step)

    ;; nothing is immediately on ?x (disk or peg) at a given step
    (clear ?x - (either disk peg) ?t - step)

    ;; successor relation between steps
    (next ?t1 - step ?t2 - step)

    ;; a move was performed during step ?t (i.e., between ?t and its successor)
    (moved ?t - step)

    ;; static ordering: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Actions: for each disk (A..E) we provide two action schemas:
  ;;   - move-<Disk>-to-peg : move the disk to an empty peg
  ;;   - move-<Disk>-onto-disk : move the disk onto another top disk (requires smaller)
  ;;
  ;; Each action is parameterized by a current step ?t and its successor ?t2.
  ;; The action explicitly copies the immediate-support configuration of every
  ;; disk from ?t into ?t2, except for the moved disk whose support at ?t2
  ;; becomes the destination (?to). To maintain clear/occupied status at ?t2
  ;; we first assert all clear facts for every support at ?t2 and then delete
  ;; clear for supports that have an immediate disk on them at ?t2.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; ---------- Actions moving disk A ----------
  (:action move-A-to-peg
    :parameters (?from - (either disk peg) ?to - peg
                 ?t - step ?t2 - step
                 ?sB - (either disk peg) ?sC - (either disk peg)
                 ?sD - (either disk peg) ?sE - (either disk peg))
    :precondition (and
      (at A ?from ?t)
      (clear A ?t)
      (clear ?to ?t)
      ;; supports of other disks at time ?t
      (at B ?sB ?t)
      (at C ?sC ?t)
      (at D ?sD ?t)
      (at E ?sE ?t)
      (next ?t ?t2)
      (not (moved ?t))
    )
    :effect (and
      ;; new immediate supports at time ?t2
      (at A ?to ?t2)
      (at B ?sB ?t2)
      (at C ?sC ?t2)
      (at D ?sD ?t2)
      (at E ?sE ?t2)

      ;; initialize all clear facts at ?t2 then remove cleared ones that are occupied
      (clear left ?t2) (clear middle ?t2) (clear right ?t2)
      (clear A ?t2) (clear B ?t2) (clear C ?t2) (clear D ?t2) (clear E ?t2)

      ;; supports that receive a disk at ?t2 are not clear
      (not (clear ?to ?t2))
      (not (clear ?sB ?t2))
      (not (clear ?sC ?t2))
      (not (clear ?sD ?t2))
      (not (clear ?sE ?t2))

      ;; mark that a move happened at ?t
      (moved ?t)
    )
  )

  (:action move-A-onto-disk
    :parameters (?from - (either disk peg) ?to - disk
                 ?t - step ?t2 - step
                 ?sB - (either disk peg) ?sC - (either disk peg)
                 ?sD - (either disk peg) ?sE - (either disk peg))
    :precondition (and
      (at A ?from ?t)
      (clear A ?t)
      (clear ?to ?t)
      (smaller A ?to)
      (at B ?sB ?t)
      (at C ?sC ?t)
      (at D ?sD ?t)
      (at E ?sE ?t)
      (next ?t ?t2)
      (not (moved ?t))
    )
    :effect (and
      (at A ?to ?t2)
      (at B ?sB ?t2)
      (at C ?sC ?t2)
      (at D ?sD ?t2)
      (at E ?sE ?t2)

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

  ;; ---------- Actions moving disk B ----------
  (:action move-B-to-peg
    :parameters (?from - (either disk peg) ?to - peg
                 ?t - step ?t2 - step
                 ?sA - (either disk peg) ?sC - (either disk peg)
                 ?sD - (either disk peg) ?sE - (either disk peg))
    :precondition (and
      (at B ?from ?t)
      (clear B ?t)
      (clear ?to ?t)
      (at A ?sA ?t)
      (at C ?sC ?t)
      (at D ?sD ?t)
      (at E ?sE ?t)
      (next ?t ?t2)
      (not (moved ?t))
    )
    :effect (and
      (at B ?to ?t2)
      (at A ?sA ?t2)
      (at C ?sC ?t2)
      (at D ?sD ?t2)
      (at E ?sE ?t2)

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

  (:action move-B-onto-disk
    :parameters (?from - (either disk peg) ?to - disk
                 ?t - step ?t2 - step
                 ?sA - (either disk peg) ?sC - (either disk peg)
                 ?sD - (either disk peg) ?sE - (either disk peg))
    :precondition (and
      (at B ?from ?t)
      (clear B ?t)
      (clear ?to ?t)
      (smaller B ?to)
      (at A ?sA ?t)
      (at C ?sC ?t)
      (at D ?sD ?t)
      (at E ?sE ?t)
      (next ?t ?t2)
      (not (moved ?t))
    )
    :effect (and
      (at B ?to ?t2)
      (at A ?sA ?t2)
      (at C ?sC ?t2)
      (at D ?sD ?t2)
      (at E ?sE ?t2)

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

  ;; ---------- Actions moving disk C ----------
  (:action move-C-to-peg
    :parameters (?from - (either disk peg) ?to - peg
                 ?t - step ?t2 - step
                 ?sA - (either disk peg) ?sB - (either disk peg)
                 ?sD - (either disk peg) ?sE - (either disk peg))
    :precondition (and
      (at C ?from ?t)
      (clear C ?t)
      (clear ?to ?t)
      (at A ?sA ?t)
      (at B ?sB ?t)
      (at D ?sD ?t)
      (at E ?sE ?t)
      (next ?t ?t2)
      (not (moved ?t))
    )
    :effect (and
      (at C ?to ?t2)
      (at A ?sA ?t2)
      (at B ?sB ?t2)
      (at D ?sD ?t2)
      (at E ?sE ?t2)

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

  (:action move-C-onto-disk
    :parameters (?from - (either disk peg) ?to - disk
                 ?t - step ?t2 - step
                 ?sA - (either disk peg) ?sB - (either disk peg)
                 ?sD - (either disk peg) ?sE - (either disk peg))
    :precondition (and
      (at C ?from ?t)
      (clear C ?t)
      (clear ?to ?t)
      (smaller C ?to)
      (at A ?sA ?t)
      (at B ?sB ?t)
      (at D ?sD ?t)
      (at E ?sE ?t)
      (next ?t ?t2)
      (not (moved ?t))
    )
    :effect (and
      (at C ?to ?t2)
      (at A ?sA ?t2)
      (at B ?sB ?t2)
      (at D ?sD ?t2)
      (at E ?sE ?t2)

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

  ;; ---------- Actions moving disk D ----------
  (:action move-D-to-peg
    :parameters (?from - (either disk peg) ?to - peg
                 ?t - step ?t2 - step
                 ?sA - (either disk peg) ?sB - (either disk peg)
                 ?sC - (either disk peg) ?sE - (either disk peg))
    :precondition (and
      (at D ?from ?t)
      (clear D ?t)
      (clear ?to ?t)
      (at A ?sA ?t)
      (at B ?sB ?t)
      (at C ?sC ?t)
      (at E ?sE ?t)
      (next ?t ?t2)
      (not (moved ?t))
    )
    :effect (and
      (at D ?to ?t2)
      (at A ?sA ?t2)
      (at B ?sB ?t2)
      (at C ?sC ?t2)
      (at E ?sE ?t2)

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

  (:action move-D-onto-disk
    :parameters (?from - (either disk peg) ?to - disk
                 ?t - step ?t2 - step
                 ?sA - (either disk peg) ?sB - (either disk peg)
                 ?sC - (either disk peg) ?sE - (either disk peg))
    :precondition (and
      (at D ?from ?t)
      (clear D ?t)
      (clear ?to ?t)
      (smaller D ?to)
      (at A ?sA ?t)
      (at B ?sB ?t)
      (at C ?sC ?t)
      (at E ?sE ?t)
      (next ?t ?t2)
      (not (moved ?t))
    )
    :effect (and
      (at D ?to ?t2)
      (at A ?sA ?t2)
      (at B ?sB ?t2)
      (at C ?sC ?t2)
      (at E ?sE ?t2)

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

  ;; ---------- Actions moving disk E ----------
  (:action move-E-to-peg
    :parameters (?from - (either disk peg) ?to - peg
                 ?t - step ?t2 - step
                 ?sA - (either disk peg) ?sB - (either disk peg)
                 ?sC - (either disk peg) ?sD - (either disk peg))
    :precondition (and
      (at E ?from ?t)
      (clear E ?t)
      (clear ?to ?t)
      (at A ?sA ?t)
      (at B ?sB ?t)
      (at C ?sC ?t)
      (at D ?sD ?t)
      (next ?t ?t2)
      (not (moved ?t))
    )
    :effect (and
      (at E ?to ?t2)
      (at A ?sA ?t2)
      (at B ?sB ?t2)
      (at C ?sC ?t2)
      (at D ?sD ?t2)

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

  (:action move-E-onto-disk
    :parameters (?from - (either disk peg) ?to - disk
                 ?t - step ?t2 - step
                 ?sA - (either disk peg) ?sB - (either disk peg)
                 ?sC - (either disk peg) ?sD - (either disk peg))
    :precondition (and
      (at E ?from ?t)
      (clear E ?t)
      (clear ?to ?t)
      (smaller E ?to)
      (at A ?sA ?t)
      (at B ?sB ?t)
      (at C ?sC ?t)
      (at D ?sD ?t)
      (next ?t ?t2)
      (not (moved ?t))
    )
    :effect (and
      (at E ?to ?t2)
      (at A ?sA ?t2)
      (at B ?sB ?t2)
      (at C ?sC ?t2)
      (at D ?sD ?t2)

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