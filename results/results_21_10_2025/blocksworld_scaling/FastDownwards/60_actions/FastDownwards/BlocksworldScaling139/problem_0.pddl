(define (problem example-multiagent-blocks)
  (:domain multiagent-blocks)

  ;; Example objects (invented because agent reports and public configuration were not provided)
  (:objects
    a e i b c d - block
    table1 - table
    vowel_agent consonant_agent - agent
  )

  ;; Example initial state (invented)
  ;; - on relationships:
  ;;   a on table1
  ;;   b on table1
  ;;   c on b
  ;;   d on table1
  ;;   e on c
  ;;   i on table1
  ;; - clear holds for blocks that have nothing on them
  (:init
    ;; types are declared in domain; we set block typing facts via predicates below where needed
    ;; on facts:
    (on a table1)
    (on b table1)
    (on c b)
    (on d table1)
    (on e c)
    (on i table1)

    ;; clear facts (blocks without anything on top)
    (clear a)
    (clear e)
    (clear i)
    (clear d)

    ;; b and c are not clear because c on b and e on c respectively (so not listed)

    ;; vowel / consonant classification (required by agent-specific constraints)
    (vowel a)
    (vowel e)
    (vowel i)
    (consonant b)
    (consonant c)
    (consonant d)
  )

  ;; Example goal (invented because no target configuration was provided):
  ;; Build a single tower (from bottom upwards): b on table1, c on b, d on c, i on d, e on i, a on e
  (:goal
    (and
      (on b table1)
      (on c b)
      (on d c)
      (on i d)
      (on e i)
      (on a e)
      ;; top block a should be clear
      (clear a)
    )
  )
)