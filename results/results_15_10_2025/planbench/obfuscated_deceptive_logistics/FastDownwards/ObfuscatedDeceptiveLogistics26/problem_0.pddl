(define (problem scenario1)
  (:domain orchestrator-domain)

  ; NOTE: The original use-case referenced two STATEMENT blocks containing
  ; initial facts, goal facts, and a plan trace. Those STATEMENT blocks were
  ; not provided to this orchestrator. Per instructions, no facts have been
  ; invented. The objects below are declared to match the example identifier
  ; range mentioned in the specification (object_0 .. object_14).
  ; If you have the STATEMENT data, replace the empty :init and :goal
  ; sections with the exact facts and goals from that STATEMENT.

  (:objects
    object_0 object_1 object_2 object_3 object_4
    object_5 object_6 object_7 object_8 object_9
    object_10 object_11 object_12 object_13 object_14 - obj
  )

  ; No initial facts provided in the input use-case; left intentionally empty.
  (:init
    ; (No predicates supplied by the observer; initial state is empty)
  )

  ; No goal facts provided in the input use-case; using a trivially satisfiable goal would be misleading.
  ; The goal must be supplied by the observer; left empty here as (and) (i.e., no conjuncts).
  (:goal (and)
  )
)