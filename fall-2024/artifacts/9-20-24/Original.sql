select
	"test_groups"."name",
	test_groups_id,
	"groups"."group_name",
	test_results.name as test_result_name,
	"test_results"."status",
	"test_results"."marks_earned",
	"test_results"."marks_total",
	"output",
	"extra_info",
	"error_type"
from
	"test_groups"
inner join "test_group_results" "test_group_results_test_groups" on
	"test_group_results_test_groups"."test_group_id" = "test_groups"."id"
inner join "test_results" on
	"test_results"."test_group_result_id" = "test_group_results_test_groups"."id"
inner join "test_runs" "test_runs_test_group_results" on
	"test_runs_test_group_results"."id" = "test_group_results_test_groups"."test_run_id"
inner join "groupings" "groupings_test_runs" on
	"groupings_test_runs"."id" = "test_runs_test_group_results"."grouping_id"
inner join "groups" on
	"groups"."id" = "groupings_test_runs"."group_id"
inner join (
	select
		test_groups.id as test_groups_id,
		MAX(test_group_results.created_at) as test_group_results_created_at
	from
		"test_groups"
	inner join "test_group_results" on
		"test_group_results"."test_group_id" = "test_groups"."id"
	inner join "test_runs" on
		"test_runs"."id" = "test_group_results"."test_run_id"
	inner join "groupings" on
		"groupings"."id" = "test_runs"."grouping_id"
	where
		"test_groups"."assessment_id" = 15
		and "test_runs"."submission_id" is not null
	group by
		"test_groups"."id",
		"groupings"."id") sub on
	test_groups.id = sub.test_groups_id
	and test_group_results_test_groups.created_at = sub.test_group_results_created_at
where
	"test_groups"."assessment_id" = 15