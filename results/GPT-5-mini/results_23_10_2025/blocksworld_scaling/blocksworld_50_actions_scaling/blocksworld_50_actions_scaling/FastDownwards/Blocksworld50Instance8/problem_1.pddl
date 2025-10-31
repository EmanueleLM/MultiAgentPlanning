(define (problem blocksworld-ordered-instance)
  (:domain blocks-world-ordered)
  (:objects
    a b c d e f g h i j k l m n - block
    worker1 worker2 orchestrator - agent
  )

  (:init
    ;; initial stacks bottom-to-top:
    (ontable d)
    (on j d)
    (on m j)
    (on f m)
    (on h f)
    (on a h)
    (on c a)

    (ontable e)
    (on k e)

    (ontable l)
    (on b l)

    (ontable n)
    (on g n)
    (on i g)

    ;; clear blocks initially (top of each stack)
    (clear c)
    (clear k)
    (clear b)
    (clear i)

    ;; agent is empty-handed at start
    (handempty orchestrator)

    ;; sequencing control starts at done0
    (done0)
  )

  ;; Goal: require the full prescribed sequence to be executed (done50),
  ;; rather than directly asserting final on/ontable facts.
  (:goal (done50))
)