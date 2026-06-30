import type { WeatherResponse } from "./types";

export const getWeather = async (url: string) => {
	const res = await fetch(url);
	if (!res.ok) {
		throw new Error("failed fetch");
	}
	const data = (await res.json()) as WeatherResponse;
	return data;
};
