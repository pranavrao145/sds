SELECT
	tg.name,
	tg.id,
	ltr.group_name,
	tr.name AS test_result_name,
	tr.status,
	tr.marks_earned,
	tr.marks_total
FROM
	test_results tr
INNER JOIN test_group_results tgr ON
	tr.test_group_result_id = tgr.id
INNER JOIN test_groups tg ON
	tgr.test_group_id = tg.id
INNER JOIN (
	SELECT
		tr2.id,
		tr2.grouping_id,
		g2.group_name
	FROM
		test_runs tr2
	INNER JOIN (
		SELECT
				MAX(created_at) AS test_runs_created_at,
				grouping_id
		FROM
				test_runs
		GROUP BY
				grouping_id
		) ltrg ON
		ltrg.grouping_id = tr2.grouping_id
		AND ltrg.test_runs_created_at = tr2.created_at
	INNER JOIN groupings g ON
		ltrg.grouping_id = g.id
	INNER JOIN "groups" g2 ON
		g.group_id = g2.id
	WHERE
		tr2.submission_id IS NOT NULL
) ltr ON
	tgr.test_run_id = ltr.id
